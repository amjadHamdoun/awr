import 'dart:async';
import 'package:awr_vendor/screens/customerCars/bloc/customer_cars_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../detailsCustomerCar/details_customer_car_page.dart';
import '../bloc/customer_cars_bloc.dart';
import 'customer_cars_item_widget.dart';

class MapCustomerCarsWidget extends StatefulWidget {
  final CustomerCarsBloc bloc;
  final VoidCallback voidCallback;

  const MapCustomerCarsWidget(
      {super.key, required this.bloc, required this.voidCallback});

  @override
  State<MapCustomerCarsWidget> createState() => _MapCustomerCarsWidgetState();
}

class _MapCustomerCarsWidgetState extends State<MapCustomerCarsWidget> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static late CameraPosition _kGooglePlex;

  @override
  void initState() {
    _kGooglePlex = const CameraPosition(
      target: LatLng(
        25.323850,
        55.383116,
      ),
      zoom: 11.4746,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCarsBloc, CustomerCarsState>(
      bloc: widget.bloc,
      builder: (context, state) {
        return Stack(
          children: [
            GoogleMap(
              gestureRecognizers: Set()
                ..add(Factory<OneSequenceGestureRecognizer>(
                    () => EagerGestureRecognizer()))
                ..add(
                    Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
                ..add(Factory<ScaleGestureRecognizer>(
                    () => ScaleGestureRecognizer()))
                ..add(
                    Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
                ..add(Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer())),
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              mapType: MapType.normal,
              onTap: (lanlat) {
                widget.bloc.add(const ChangeShowCustomerDetailsEvent(
                    showCustomerDetails: false, customerCarsList: null));
              },
              initialCameraPosition: _kGooglePlex,
              markers: Set<Marker>.of(state.markers.values),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            if (state.showCustomerDetails && state.customerDetails != null)
              CustomerCarsItem(
                  voidCallback: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsCustomerCar(
                            customerCarsList: state.customerDetails!,
                          ),
                        )).then(
                      (value) {
                        widget.voidCallback();
                      },
                    );
                  },
                  customerCarsList: state.customerDetails!),
          ],
        );
      },
    );
  }
}
