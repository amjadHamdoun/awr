
import 'package:awr_vendor/core/constant/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({super.key, required this.text, required this.icon, this.onTap});

  final String text, icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 7.h),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                icon,
                height:StyleConstants.iconSize.sp,
                width: StyleConstants.iconSize.sp,
                color: Theme.of(context).primaryColor,

              ),
              SizedBox(width: 10.w),
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: (StyleConstants.fontSize-2).sp,
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.w500),
                ),
              ),
               Icon(Icons.arrow_forward_ios,
              color:  Theme.of(context).hintColor,
              size: (StyleConstants.iconSize-2).sp
              ),
            ],
          ),
        ),
      ),
    );
  }
}
