

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void addMarker({required String image,required double lat,required Map<MarkerId, Marker>  markers,
  required double lng,required int id,required remark,required VoidCallback voidCallBack}) async
{
  final MarkerId markerId = MarkerId(id.toString());
  final Marker marker = Marker(
    markerId: markerId,
    position: LatLng(
      lat,
      lng,
    ),
    onTap: voidCallBack,
  );
    markers[markerId] = marker;
}