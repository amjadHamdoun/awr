import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../customColors/my_colors.dart';

class AccountCard extends StatelessWidget {
  final String accountName;
  final String accountAmount;
  final String color;
  final bool withBorder;


  const AccountCard(
      {Key? key,
        required this.accountName,
        required this.accountAmount,
        required this.color,
        required this.withBorder

      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
       width: 0.43.sw,
      height: 45.h,

      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17.5.r),
          side:withBorder?  BorderSide(
            color: Colors.grey.shade700,

            width: 2.0, // Border width
          ):BorderSide.none,

        ),
        color: Color(int.parse(color)),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(accountName.isNotEmpty)
            Text(
              accountName,
              style: TextStyle(
                fontSize: 11.5.sp,
                color: MyColors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 3.h,),
            if(accountAmount.isNotEmpty)

              Text(
              accountAmount,
              style: TextStyle(
                fontSize: 10.5.sp,
                color: MyColors.white,
              ),
              textAlign: TextAlign.center,
            ),


          ],
        ),
      ),
    );
  }
}
