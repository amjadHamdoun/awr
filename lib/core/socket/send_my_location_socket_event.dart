import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../../core/constant/error_constants.dart';
import '../../preference.dart';
import '../constant/app_constants.dart';
import '../constant/key_constants.dart';




abstract class SendMyLocationSocketEvent {
  Future<Either<String, String>> sendMyLocation({
    required double lat,required double long
  });
}

class SendMyLocationSocketEventImpl extends SendMyLocationSocketEvent {
  final IO.Socket socket;
  final DataConnectionChecker networkInfo;

  SendMyLocationSocketEventImpl({required this.socket, required this.networkInfo});

  @override
  Future<Either<String, String>> sendMyLocation({
    required double lat, required double long
  }) async {
    if (await networkInfo.hasConnection) {
      try {
        if(socket.connected)
          {
            socket.emit(AppConstants.socketSendLocationEvent, {
              'latitude': lat,
              'longitude': long,
              'userToken': Preferences.preferences!.getString(KeyConstants.keyUserToken)??''
            });
            return const Right(("Data sent successfully"));

          }
        else{
          return Left(Er.socketIsDisconnected);
        }

      } catch (e) {
        log(e.toString());
        return Left(Er.error);
      }
    } else {
      return Left(Er.networkError);
    }
  }
}
