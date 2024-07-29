import 'package:awr_vendor/core/mixins/base_mixin.dart';
import 'package:awr_vendor/screens/settings/widgets/profile_header_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/app_constants.dart';
import 'widgets/settings_item_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with BaseMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings".tr(),
          style: TextStyle(
            fontSize: StyleConstants.fontSize.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 12.r),
          child: Column(
            children: [
              const ProfileHeaderWidget(name: 'Amjad',email: 'amjadhamdoun0@gmail.com',),
              Divider(
                height: 10.h,
                color: Theme.of(context).hintColor,
                thickness: 1,
              ),
              SettingsItem(onTap: (){
                showLanguageDialog(context);
              },icon:"assets/svg/language.svg" ,text: "Change Language".tr(),),
              Divider(
                height: 10.h,
                color: Theme.of(context).hintColor,
                thickness: 1,
              ),

            ],
          ),
        ),
      ),
    );
  }

}
