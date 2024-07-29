import 'dart:developer';

import 'package:awr_vendor/core/constant/app_constants.dart';
import 'package:awr_vendor/core/constant/key_constants.dart';
import 'package:awr_vendor/preference.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

import '../../../core/socket/send_my_location_socket_event.dart';
import 'home_state.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SendMyLocationSocketEvent sendMyLocationSocketEvent;

  HomeBloc({required this.sendMyLocationSocketEvent})
      : super(HomeState.initial()) {
    on<ChangePageEvent>((event, emit) async {
      emit(state.rebuild((b) => b..page = event.page));
    });

    on<HaveTripEvent>((event, emit) async {
      //in future will be API
      bool isTripOpened =
          Preferences.preferences!.getBool(KeyConstants.keyTripIsOpened) ??
              false;
      int tripId =
          Preferences.preferences!.getInt(KeyConstants.keyTripId) ??
              0;
      if(isTripOpened)
        {
          for(var item in TestConstants.customerCarsModel.customerCars!)
          {
            if(item.id==tripId){
              emit(state.rebuild((b) => b..currentTrip = item));
            }
          }
        }
      else{
        emit(state.rebuild((b) => b..currentTrip = null));
      }

      emit(state.rebuild((b) => b..isTripOpened = isTripOpened));
    });

    on<ChangeVendorLocationEvent>((event, emit) async {
      if (state.isTripOpened) {
        emit(state.rebuild((b) => b
          ..lat = event.lat
          ..long = event.long));

        final result = await sendMyLocationSocketEvent.sendMyLocation(
            lat: event.lat, long: event.long);

        return result.fold((l) async {
          print('l');
          emit(state.rebuild((b) => b..error = l));
          emit(state.rebuild((b) => b..error = ''));
        }, (r) async {
          print('r');
          emit(state.rebuild((b) => b..message = r));
          emit(state.rebuild((b) => b..message = ''));
        });
      }
    });
  }
}
