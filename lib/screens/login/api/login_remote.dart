import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import '../../../core/constant/app_constants.dart';
import '../../../core/constant/error_constants.dart';
import '../model/login_model.dart';




abstract class LoginRemoteDataSource {
  Future<Either<String, LoginModel>> login({
    required Map<String,dynamic> obj
  });
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  LoginRemoteDataSourceImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<String, LoginModel>> login({
    required Map<String,dynamic> obj
  }) async {
    if (await networkInfo.hasConnection) {
      try {
         if( await getId()!=null)
           {
             final re = await dio.post(
               AppConstants.login,
               data: json.encode(obj),
               options: Options(
                 followRedirects: false,
                 validateStatus: (status) {
                   return status! < 500;
                 },
               ),
             );
             return Right(LoginModel.fromJson(json.decode(re.data)));
           }
         {
           return const Left("IS Not Physical Device");
         }



      } on DioException catch (ex) {
        if (ex.type == DioExceptionType.connectionTimeout) {
          return Left(Er.serverNotResponding);
        } else if (ex.type == DioExceptionType.receiveTimeout) {
          return Left(Er.serverNotResponding);
        }
        log(ex.toString());
        return Left(Er.serverError);
      } catch (e) {
        log(e.toString());
        return Left(Er.error);
      }
    } else {
      return Left(Er.networkError);
    }
  }
}

Future<String?> getId() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();


  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    if(iosDeviceInfo.isPhysicalDevice)
      {
        return iosDeviceInfo.identifierForVendor;
      }
    // unique ID on iOS
  } else if(Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    if(androidDeviceInfo.isPhysicalDevice)
      {
        return androidDeviceInfo.id; // unique ID on Android
      }
  }
  return null;
}
