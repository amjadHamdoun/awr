import 'dart:async';
import 'dart:io';
import 'package:awr_vendor/screens/home/widgets/current_trip_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:awr_vendor/core/constant/app_constants.dart';
import 'package:awr_vendor/core/mixins/base_mixin.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import '../../core/utils/live_tracking.dart';
import '../../core/utils/location_settings.dart';
import '../../injection.dart';
import '../customerCars/customer_cars_page.dart';
import '../detailsCustomerCar/details_customer_car_page.dart';
import '../history/history_page.dart';
import '../settings/settings_page.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_state.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with BaseMixin {
  late HomeBloc homeBloc;
  PageController pageController = PageController(initialPage: 0);
  late StreamSubscription<Position> positionStream ;


  @override
  void initState() {
    homeBloc = sl<HomeBloc>();
    homeBloc.add(HaveTripEvent());
    liveTracking(
        (){
          LocationSettings locationSettings = locationSettingsInit();
          positionStream =
              Geolocator.getPositionStream(locationSettings: locationSettings)
                  .listen((Position position) {
                homeBloc.add(ChangeVendorLocationEvent(
                    long: position.longitude,
                    lat: position.latitude
                ));
              });
        }
    );

    super.initState();
  }

  @override
  void dispose() {
    homeBloc.close();
    positionStream.cancel();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {
        if(state.message.isNotEmpty){
          Fluttertoast.showToast(
              msg: state.message,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Theme.of(context).primaryColor,
              textColor: Theme.of(context).primaryColorLight,
              fontSize: 16.0
          );
        }
        else if(state.error.isNotEmpty){
          Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Theme.of(context).primaryColorLight,
              fontSize: 16.0
          );
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        bloc: homeBloc,
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () async {
              showAlertDialog(
                context: context,
                title: "Exit".tr(),
                msg: "Are You Sure You want to close the App".tr(),
                positivePressed: () {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else {
                    exit(0);
                  }
                },
                negativePressed: () {
                  Navigator.pop(context);
                },
                cancelable: true,
                negativeBtn: "Cancel".tr(),
                positiveBtn: "Confirm".tr(),
              );

              return false;
            },
            child: Scaffold(
              body: Column(
                children: [

                  Expanded(
                    child: PageView(
                        controller: pageController,
                        onPageChanged: (index) {
                          homeBloc.add(ChangePageEvent(page: index));
                        },
                        children:  [
                          CustomerCarsPage(voidCallback: (){
                            homeBloc.add(HaveTripEvent());
                          },),
                          const HistoryPage(),
                          const SettingsPage(),
                        ]),
                  ),
                  if(state.isTripOpened&&state.currentTrip!=null)
                    InkWell(
                      onTap: () async {
                        await Navigator.push(context, MaterialPageRoute(builder: (context) =>
                            DetailsCustomerCar(
                                customerCarsList:state.currentTrip!
                            ),)).then((value) {
                          homeBloc.add(HaveTripEvent());
                        },);
                      },
                        child: CurrentTripWidget(currentTrip:state.currentTrip! ,)),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/svg/track.svg",
                        height: (StyleConstants.iconSize - 4).r,
                        width: (StyleConstants.iconSize - 4).r,
                        color: state.page == 0
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColorDark,
                        // color: Colors.black,
                      ),
                      label: "Customers".tr(),
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/svg/history.svg",
                        height: (StyleConstants.iconSize - 4).r,
                        width: (StyleConstants.iconSize - 4).r,
                        color: state.page == 1
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColorDark,
                        // color: Colors.black,
                      ),
                      label: "History".tr(),
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/svg/settings.svg",
                        height: (StyleConstants.iconSize - 4).r,
                        width: (StyleConstants.iconSize - 4).r,
                        color: state.page == 2
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColorDark,
                        // color: Colors.black,
                      ),
                      label: "settings".tr(),
                    ),
                  ],
                  selectedLabelStyle: TextStyle(
                    fontSize: (StyleConstants.fontSize - 4).sp,
                  ),
                  unselectedFontSize: (StyleConstants.fontSize - 5).sp,
                  currentIndex: state.page,
                  unselectedItemColor: Theme.of(context).primaryColorDark,
                  selectedItemColor: Theme.of(context).primaryColor,
                  showUnselectedLabels: true,
                  onTap: (index) {
                    homeBloc.add(ChangePageEvent(page: index));
                    pageController.jumpToPage(index);
                  }),
            ),
          );
        },
      ),
    );
  }
}
