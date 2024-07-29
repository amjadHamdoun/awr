
import 'package:awr_vendor/core/constant/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/mixins/base_mixin.dart';

class ProfileHeaderWidget extends StatelessWidget with BaseMixin {
  const ProfileHeaderWidget({super.key, this.name, this.email});

  final String? name, email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.0.h),
      child: Row(
        children: [

          Container(
            width: 75.r,
            height: 75.r,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/ic_launcher.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: 12.r,),

          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name!,
                  style: TextStyle(
                      fontSize: (StyleConstants.fontSize-2).sp,
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  email!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: (StyleConstants.fontSize-4).sp,
                      color: Theme.of(context).hintColor,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5.h,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
