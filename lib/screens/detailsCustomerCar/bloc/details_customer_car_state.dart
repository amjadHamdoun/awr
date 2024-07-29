



import 'package:built_value/built_value.dart';



part 'details_customer_car_state.g.dart';


abstract class DetailsCustomerCarState implements Built<DetailsCustomerCarState,
    DetailsCustomerCarStateBuilder> {

 bool get tripIsOpened;
  int get tripId;




  DetailsCustomerCarState._();

  factory DetailsCustomerCarState([void Function(DetailsCustomerCarStateBuilder) updates]) = _$DetailsCustomerCarState;

  factory DetailsCustomerCarState.initial() {
    return DetailsCustomerCarState((b) => b
        ..tripIsOpened=false
        ..tripId=-1
    );
  }
}


