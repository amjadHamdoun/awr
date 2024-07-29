import 'package:awr_vendor/screens/detailsCustomerCar/bloc/details_customer_car_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/app_constants.dart';
import '../../core/customWidgets/elevated_button_widget.dart';
import '../../injection.dart';
import '../customerCars/model/customer_cars_model.dart';
import 'bloc/details_customer_car_bloc.dart';

class DetailsCustomerCar extends StatefulWidget {
  final CustomerCarsList customerCarsList;

  const DetailsCustomerCar({super.key, required this.customerCarsList});

  @override
  State<DetailsCustomerCar> createState() => _DetailsCustomerCarState();
}

class _DetailsCustomerCarState extends State<DetailsCustomerCar> {
  DateFormat dateFormat = DateFormat("dd-MM-yyyy hh:mm a", 'en');
  DetailsCustomerCarBloc bloc=sl<DetailsCustomerCarBloc>();

  @override
  void initState() {
    bloc.add(GetTripStatusEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Customer Car Details'.tr(),
          style: TextStyle(
            fontSize: StyleConstants.fontSize.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocBuilder<DetailsCustomerCarBloc,DetailsCustomerCarState>(
        bloc: bloc,
        builder: (context, state) {
         return Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Big Picture
                SizedBox(
                  width: double.infinity,
                  height: 300.h,
                  child: Image.asset(
                    widget.customerCarsList.image!,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 16.h),
                // Name
                Text(
                  widget.customerCarsList.customerName ?? "",
                  style: TextStyle(
                    fontSize: (StyleConstants.fontSize + 4).sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: 8.h),
                // Date
                Text(
                  '${"Date:".tr()} ${dateFormat.format(widget.customerCarsList.dateTime!)}',
                  style: TextStyle(
                    fontSize: (StyleConstants.fontSize - 2).sp,
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
                SizedBox(height: 8.h),
                // Date
                Text(
                  '${"Remark:".tr()} ${widget.customerCarsList.remark}',
                  style: TextStyle(
                    fontSize: (StyleConstants.fontSize - 2).sp,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                SizedBox(height: 32.h),
                // Buttons
                if(!state.tripIsOpened)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: ElevatedButtonWidget(
                    onPressed: () {
                       bloc.add(StartTripEvent(tripId: widget.customerCarsList.id!));
                    },
                    text: "Start Trip".tr(),
                    textColor: Theme.of(context).primaryColorLight,
                  ),
                )else if(state.tripIsOpened&&state.tripId==widget.customerCarsList.id)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: ElevatedButtonWidget(
                      onPressed: () {
                        bloc.add(const EndTripEvent( pickupAndDeliveryIsDone: true));
                      },
                      text: "End Trip".tr(),
                      textColor: Theme.of(context).primaryColorLight,
                      bgColor: Theme.of(context).primaryColorDark,
                    ),
                  )
              ],
            ),
          );
        },

      ),
    );
  }
}
