import 'dart:io';
import 'package:awr_vendor/preference.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/constant/key_constants.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/location_background_service.dart';
import 'core/utils/request_location.dart';
import 'core/utils/request_notification.dart';
import 'injection.dart' as di;
import 'package:upgrader/upgrader.dart';
import 'screens/home/home_page.dart';
import 'screens/login/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await EasyLocalization.ensureInitialized();
  await Preferences.init();
  await requestLocationPermission();
  await requestNotification();
  await initializeLocationBackgroundService();
  await dotenv.load(fileName: ".env");

  String userId =
      Preferences.preferences!.getString(KeyConstants.keyUserToken) ?? "";
  bool jailBroken = await FlutterJailbreakDetection.jailbroken;

  if(!jailBroken)
    {
      runApp(
        EasyLocalization(
            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
            ],
            path: 'assets/translations',
            fallbackLocale: const Locale('en'),
            child: MyApp(
              userId: userId,
            )),
      );
    }

}

class MyApp extends StatelessWidget {
  final String userId;

  const MyApp({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: "Vendor",
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme(),
            home: UpgradeAlert(
              showIgnore: false,
              showLater: false,
              dialogStyle: Platform.isAndroid
                  ? UpgradeDialogStyle.material
                  : UpgradeDialogStyle.cupertino,
              child: userId.isNotEmpty ? const HomePage() : const LoginPage(),
            ));
      },
    );
  }
}
