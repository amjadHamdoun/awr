import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import '../../../core/constant/app_constants.dart';
import '../../../core/constant/error_constants.dart';
import '../../../core/constant/key_constants.dart';
import '../../../preference.dart';
import '../model/customer_cars_model.dart';




abstract class GetCustomerCarsRemoteDataSource {
  Future<Either<String, CustomerCarsModel>> getCustomerCars();
}

class GetCustomerCarsRemoteDataSourceImpl extends GetCustomerCarsRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  GetCustomerCarsRemoteDataSourceImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<String, CustomerCarsModel>> getCustomerCars() async {
    if (await networkInfo.hasConnection) {
      try {
        String? userToken= Preferences.preferences!.getString(KeyConstants.keyUserToken);

        final re = await dio.post(
          AppConstants.customersCars,
            options:Options(
                headers: {
                  'Authorization': 'Bearer $userToken',
                }
            )
        );

        return Right(CustomerCarsModel.fromJson(json.decode(re.data)));
      } on DioException catch (ex) {
        if (ex.type == DioExceptionType.connectionTimeout) {
          return Left(Er.serverNotResponding);
        } else if (ex.type == DioExceptionType.receiveTimeout) {
          return Left(Er.serverNotResponding);
        }
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
