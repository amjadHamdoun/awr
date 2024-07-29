import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/app_constants.dart';
import 'widgets/history_cars_item_widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "History".tr(),
            style: TextStyle(
              fontSize: StyleConstants.fontSize.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {},
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
                child: index == 0
                    ? HistoryItem(
                        voidCallback: () async {},
                        customerName: 'John',
                        status: 3,
                      )
                    : HistoryItem(
                        voidCallback: () async {},
                        customerName: 'Reymond',
                        status: 2,
                      ),
              );
            },
          ),
        ));
  }
}
