import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/customColors/my_colors.dart';
import '../../core/constant/app_constants.dart';
import '../../core/customWidgets/error_widget.dart';
import '../../core/mixins/base_mixin.dart';
import '../../injection.dart';
import '../detailsCustomerCar/details_customer_car_page.dart';
import '../home/bloc/home_bloc.dart';
import 'bloc/customer_cars_bloc.dart';
import 'bloc/customer_cars_state.dart';
import 'widgets/customer_cars_item_widget.dart';
import 'widgets/map_customer_cars_widget.dart';

class CustomerCarsPage extends StatefulWidget {
  final VoidCallback voidCallback;
  const CustomerCarsPage({super.key,required this.voidCallback});

  @override
  State<CustomerCarsPage> createState() => _CustomerCarsPageState();
}

class _CustomerCarsPageState extends State<CustomerCarsPage>
    with AutomaticKeepAliveClientMixin, BaseMixin {
  TextEditingController textEditingController = TextEditingController();

  CustomerCarsBloc bloc = sl<CustomerCarsBloc>();

  @override
  void initState() {
    bloc.add(GetCustomerCarsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<CustomerCarsBloc, CustomerCarsState>(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Customers Cars".tr(),
              style: TextStyle(
                  fontSize: StyleConstants.fontSize.sp,
                  fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          body: state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: MyColors.colorPrimary,
                  ),
                )
              : state.searchCustomerCarsModel != null
                  ? RefreshIndicator(
                      onRefresh: () async {
                        bloc.add(GetCustomerCarsEvent());
                      },
                      child: !state.showMap
                          ? ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: state.searchCustomerCarsModel!
                                      .customerCars!.length ,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.w, vertical: 2.h),
                                  child: CustomerCarsItem(
                                    voidCallback: () async {
                                     await Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                          DetailsCustomerCar(
                                            customerCarsList:state
                                                .searchCustomerCarsModel!
                                                .customerCars![index]
                                          ),)).then((value) {
                                            widget.voidCallback();
                                          },);
                                    },
                                    customerCarsList: state
                                        .searchCustomerCarsModel!
                                        .customerCars![index]
                                  ),
                                );
                              },
                            )
                          : MapCustomerCarsWidget(
                              bloc: bloc,
                                voidCallback: widget.voidCallback,
                            ),
                    )
                  : ErrorTextWidget(
                      error: state.error!,
                      callback: () {
                        bloc.add(GetCustomerCarsEvent());
                      },
                    ),
          floatingActionButton: FloatingActionButton(
            heroTag: "map",
            backgroundColor: MyColors.colorPrimary,
            onPressed: () {
              bloc.add(
                  ChangeShowMapEvent(showMap: !state.showMap));
            },
            child: Icon(
              !state.showMap ? Icons.map_outlined : Icons.list,
              color: MyColors.white,
              size: 25.sp,
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
