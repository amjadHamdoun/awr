
import 'package:awr_vendor/core/constant/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/customer_cars_model.dart';


class CustomerCarsItem extends StatelessWidget {
  const CustomerCarsItem({super.key, required this.customerCarsList,
    required this.voidCallback});

  final CustomerCarsList customerCarsList;
  final VoidCallback? voidCallback;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: voidCallback,
      child: Padding(
        padding:  EdgeInsets.all(4.0.r),
        child: Card(
          color: Theme.of(context).cardColor,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12.r,vertical: 4.h),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        customerCarsList.customerName??"",
                        style:  TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:(StyleConstants.fontSize-1).sp,
                            color: Theme.of(context).primaryColor
                        ),
                      ),
                      SizedBox( height: 10.h,),
                      Text(customerCarsList.remark??"",
                        style: TextStyle(
                            fontSize: (StyleConstants.fontSize-3).sp,
                            color: Theme.of(context).hintColor,
                            fontWeight: FontWeight.w500
                        ),
                      )
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios,
                size: StyleConstants.iconSize.sp,
                  color:Theme.of(context).iconTheme.color ,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
