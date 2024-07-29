

import 'dart:ui';

import 'package:awr_vendor/core/utils/request_location.dart';
import 'package:location/location.dart' as loc;

Future<void> liveTracking(VoidCallback voidCallBack) async {
  if(await requestLocationPermission()){
    loc.Location checkGps = loc.Location();
    if (!await checkGps.serviceEnabled()) {
      await checkGps.requestService().then((value) {
        voidCallBack();
      });
    }
    else{
     voidCallBack();
    }
  }
}
