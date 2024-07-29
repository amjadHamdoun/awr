
import 'package:awr_vendor/core/utils/add_marker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../api/get_customer_cars_remote.dart';
import '../model/customer_cars_model.dart';
import 'customer_cars_state.dart';

part 'customer_cars_event.dart';

class CustomerCarsBloc extends Bloc<CustomerCarsEvent, CustomerCarsState> {
  GetCustomerCarsRemoteDataSource getCustomerCarsRemoteDataSource;


  CustomerCarsBloc({
    required this.getCustomerCarsRemoteDataSource,

  }) : super(CustomerCarsState.initial()) {

    on<GetCustomerCarsEvent>((event, emit) async {

      emit(state.rebuild((b) => b
        ..isLoading = true
        ..error = ''
        ..isSuccess=false
      ));
      final result =
          await getCustomerCarsRemoteDataSource.getCustomerCars();

      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = l
        ));
        add(GenerateMarkersEvent());
      },
              (r) async {

        print('r');
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..searchCustomerCarsModel=r
            ..customerCarsModel=r
        ));
        add(GenerateMarkersEvent());
      }
      );


    });


    on<SearchCustomerCarsEvent>((event, emit) async {
      CustomerCarsModel? searchCustomerCarsModel =
          CustomerCarsModel(customerCars: []);
      if (event.keyWord.trim().isNotEmpty) {
        for (var item in state.customerCarsModel!.customerCars!) {
          if (item.customerName!.toLowerCase().contains(event.keyWord.toLowerCase()) ||
              item.remark!.toLowerCase().contains(event.keyWord.toLowerCase()) ||
              item.dateTime!.toString().toLowerCase().contains(event.keyWord.toLowerCase())) {
            searchCustomerCarsModel.customerCars!.add(item);
          }
        }
      } else {
        searchCustomerCarsModel = state.customerCarsModel;
      }

      emit(state.rebuild((b) => b..searchCustomerCarsModel = searchCustomerCarsModel));
    });


    on<ChangeShowMapEvent>((event, emit) async {
      emit(state.rebuild((b) => b..showMap = event.showMap));
    });

    on<ChangeShowCustomerDetailsEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..showCustomerDetails = event.showCustomerDetails
        ..customerDetails=event.customerCarsList
      ));
    });


    on<GenerateMarkersEvent>((event, emit) async {
      if(state.customerCarsModel!=null)
        {
          Map<MarkerId, Marker>  markers= <MarkerId, Marker>{};
          for(var item in state.customerCarsModel!.customerCars!){
            addMarker(image: '', lat: item.lat??0.0,markers: markers,
                lng: item.long??0.0, id: item.id!, remark: item.remark!,  voidCallBack: (){
                   add(ChangeShowCustomerDetailsEvent(showCustomerDetails: true,
                       customerCarsList: item));
                });
          }
          emit(state.rebuild((b) => b..markers = markers));
        }
    });




  }
}
