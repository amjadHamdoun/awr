import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:awr_vendor/core/constant/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../customerCars/model/customer_cars_model.dart';

class CurrentTripWidget extends StatelessWidget {
  final CustomerCarsList currentTrip;
  const CurrentTripWidget({super.key,required this.currentTrip});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 1.sw,
      height: 60.h,
      child: Card(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DefaultTextStyle(
              style: TextStyle(
                  fontSize: (StyleConstants.fontSize-2).sp,
                  color: Theme.of(context).primaryColor),
              textAlign: TextAlign.center,
              child: AnimatedTextKit(
                repeatForever: true,
                isRepeatingAnimation: true,
                displayFullTextOnTap: true,
                animatedTexts: [
                  FadeAnimatedText(
                      '${"Current Trip to :".tr()} ${currentTrip.locationName} \n ${"Customer Name :".tr()} ${currentTrip.customerName}',
                      textAlign: TextAlign.center,
                      textStyle: TextStyle(
                          fontSize: 14.5.sp,
                          color: Theme.of(context).primaryColor
                      ),
                      duration: const Duration(milliseconds: 2000)
                  ),
                ],
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
