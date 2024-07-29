part of 'details_customer_car_bloc.dart';

abstract class DetailsCustomerCarEvent extends Equatable {
  const DetailsCustomerCarEvent();
  @override
  List<Object> get props => [];
}

class StartTripEvent extends DetailsCustomerCarEvent {
   final int tripId;
   const StartTripEvent({required this.tripId});
}

class GetTripStatusEvent extends DetailsCustomerCarEvent {

}

class EndTripEvent extends DetailsCustomerCarEvent {
  final bool pickupAndDeliveryIsDone;
  const EndTripEvent({required this.pickupAndDeliveryIsDone});

}








