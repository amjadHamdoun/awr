



import 'package:built_value/built_value.dart';

import '../../customerCars/model/customer_cars_model.dart';



part 'home_state.g.dart';


abstract class HomeState implements Built<HomeState,
    HomeStateBuilder> {



  int get page;

  bool get isTripOpened;


   double? get lat;
   double? get long;
  CustomerCarsList? get currentTrip;
  String get error;
  String get message;



  HomeState._();

  factory HomeState([void Function(HomeStateBuilder) updates]) = _$HomeState;

  factory HomeState.initial() {
    return HomeState((b) => b
      ..page=0
      ..isTripOpened=false
        ..error=''
        ..message=''
    );
  }
}


