
import 'package:awr_vendor/core/constant/key_constants.dart';
import 'package:awr_vendor/preference.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'details_customer_car_state.dart';

part 'details_customer_car_event.dart';

class DetailsCustomerCarBloc extends Bloc<DetailsCustomerCarEvent, DetailsCustomerCarState> {

  DetailsCustomerCarBloc()
      : super(DetailsCustomerCarState.initial()) {

    on<StartTripEvent>((event, emit) async {
       Preferences.preferences!.setInt(KeyConstants.keyTripId, event.tripId);
       Preferences.preferences!.setBool(KeyConstants.keyTripIsOpened, true);

       emit(state.rebuild((b) => b..tripIsOpened = true));
    });

    on<GetTripStatusEvent>((event, emit) async {
      int tripId=Preferences.preferences!.getInt(KeyConstants.keyTripId)??-1;
      bool tripIsOpened=Preferences.preferences!.getBool(KeyConstants.keyTripIsOpened)??false;

      emit(state.rebuild((b) => b
        ..tripIsOpened = tripIsOpened
          ..tripId=tripId
      ));
    });

    on<EndTripEvent>((event, emit) async {
      Preferences.preferences!.setBool(KeyConstants.keyTripIsOpened, false);

      emit(state.rebuild((b) => b
        ..tripIsOpened = false
      ));
    });






  }
}


