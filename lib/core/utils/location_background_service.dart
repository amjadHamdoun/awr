import 'dart:async';
import 'dart:developer';
import 'dart:ui';
import 'package:awr_vendor/core/constant/key_constants.dart';
import 'package:awr_vendor/preference.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import '../../injection.dart' as di;
import '../socket/send_my_location_socket_event.dart';
import 'location_settings.dart';


void startBackgroundService() {
  final service = FlutterBackgroundService();
  service.startService();
}

void stopBackgroundService() {
  final service = FlutterBackgroundService();
  service.invoke("stop");
}

Future<void> initializeLocationBackgroundService() async {
  final service = FlutterBackgroundService();


  await service.configure(
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
    androidConfiguration: AndroidConfiguration(
      autoStart: true,
      onStart: onStart,
      isForegroundMode: false,
      autoStartOnBoot: true,
    ),
  );
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Preferences.init();
  SendMyLocationSocketEvent sendMyLocationSocketEvent=di.sl();

  service.on("stop").listen((event) {
    service.stopSelf();
    log("background process is now stopped");
  });

  service.on("start").listen((event) {
    log("background process is now started");
  });

  if(Preferences.preferences!.getBool(KeyConstants.keyTripIsOpened)??false)
  {
    late  StreamSubscription<Position> positionStream ;
    LocationSettings locationSettings = locationSettingsInit();
    try{
        positionStream =
          Geolocator.getPositionStream(locationSettings: locationSettings)
              .listen((Position position) {
            sendMyLocationSocketEvent.sendMyLocation(lat: position.latitude, long: position.longitude);
            log("service is successfully running ${position.latitude}");
          });
    }
    catch(e){
      positionStream.cancel();
      log(e.toString());
    }

  }




}