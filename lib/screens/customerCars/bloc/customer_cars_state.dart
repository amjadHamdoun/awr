import 'package:built_value/built_value.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/constant/app_constants.dart';
import '../model/customer_cars_model.dart';


part 'customer_cars_state.g.dart';

abstract class CustomerCarsState
    implements Built<CustomerCarsState, CustomerCarsStateBuilder> {

  bool get isLoading;

  bool get isSuccess;
  
  bool get showMap;

  bool get showCustomerDetails;

  String? get error;

  CustomerCarsModel? get customerCarsModel;

  CustomerCarsModel? get searchCustomerCarsModel;

  Map<MarkerId, Marker> get markers ;

  CustomerCarsList? get customerDetails;



  CustomerCarsState._();

  factory CustomerCarsState([void Function(CustomerCarsStateBuilder) updates]) =
      _$CustomerCarsState;

  factory CustomerCarsState.initial() {
    return CustomerCarsState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..error = ''
      ..customerCarsModel=TestConstants.customerCarsModel
      ..searchCustomerCarsModel=TestConstants.customerCarsModel
      ..showMap=true
      ..markers= <MarkerId, Marker>{}
      ..showCustomerDetails=false

    );
  }
}
