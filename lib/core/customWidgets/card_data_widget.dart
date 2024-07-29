import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../customColors/my_colors.dart';
import '../mixins/base_mixin.dart';

class CardDataWidget extends StatelessWidget with BaseMixin {
  CardDataWidget(
      {super.key,
      this.type,
      this.onPressed,
      this.onCancel,
      required this.typeColor,
      required this.valueColor});

  final String? type;
  final Color typeColor, valueColor;
  final VoidCallback? onPressed, onCancel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 2,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          width: double.infinity,
          child: Row(
            children: [
              if (onCancel != null)
                InkWell(
                    onTap: onCancel,
                    child: Icon(
                      Icons.cancel,
                      size: 22.sp,
                      color: Colors.red,
                    )),
              Expanded(
                child: Text(
                  type ?? "",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(
                      color: typeColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp),
                ),
              ),
              SizedBox(width: 8.w),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 22.sp,
                color: MyColors.colorPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
