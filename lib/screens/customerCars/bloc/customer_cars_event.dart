part of 'customer_cars_bloc.dart';

abstract class CustomerCarsEvent extends Equatable {
  const CustomerCarsEvent();
  @override
  List<Object?> get props => [];

}

class GetCustomerCarsEvent extends CustomerCarsEvent {}



class SearchCustomerCarsEvent extends CustomerCarsEvent {
  final String keyWord;
  const SearchCustomerCarsEvent({
    required this.keyWord
  });
}


class ChangeShowMapEvent extends CustomerCarsEvent {
  final bool showMap;
  const ChangeShowMapEvent({
    required this.showMap,
  });
}

class ChangeShowCustomerDetailsEvent extends CustomerCarsEvent {
  final bool showCustomerDetails;
  final CustomerCarsList? customerCarsList;

  const ChangeShowCustomerDetailsEvent({
    required this.showCustomerDetails,
    required this.customerCarsList

  });
}


class GenerateMarkersEvent extends CustomerCarsEvent {

}


