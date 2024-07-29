import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';


Future<bool> requestLocationPermission() async {
  try{


    final status = await Permission.location.request();

    if (status.isGranted) {
      log('Location permission granted');
      return(status.isGranted);
    } else if (status.isDenied) {
      log('Location permission denied');
      return(status.isDenied);
    } else if (status.isPermanentlyDenied) {
      log('Location permission permanently denied');
      await openAppSettings();
    }
    return(false);
  }
  catch(e){
    log(e.toString());
    return(false);

  }

}