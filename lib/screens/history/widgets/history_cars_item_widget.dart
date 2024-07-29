
import 'package:awr_vendor/core/constant/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key, required this.customerName,required this.status,
    required this.voidCallback});

  final String customerName;
  final int status;
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
                        customerName??"",
                        style:  TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:(StyleConstants.fontSize-1).sp,
                            color: Theme.of(context).primaryColor
                        ),
                      ),
                      SizedBox( height: 10.h,),
                      Text(status==2?'Completed'.tr():'Not Completed'.tr(),
                        style: TextStyle(
                            fontSize: (StyleConstants.fontSize-3).sp,
                            color: status==2?Colors.green:Colors.red,
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
