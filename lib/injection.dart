import 'package:awr_vendor/screens/detailsCustomerCar/bloc/details_customer_car_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:awr_vendor/screens/customerCars/api/get_customer_cars_remote.dart';
import 'package:awr_vendor/screens/customerCars/bloc/customer_cars_bloc.dart';
import 'package:awr_vendor/screens/home/bloc/home_bloc.dart';
import 'package:awr_vendor/screens/login/api/login_remote.dart';
import 'package:flutter/foundation.dart';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'core/socket/send_my_location_socket_event.dart';
import 'screens/login/bloc/login_bloc.dart';

final sl = GetIt.instance;

///
/// The [init] function is responsible for adding the instances to the graph
///
Future<void> init() async {
  //!External

  /// Adding the [Dio] instance to the graph to be later used by the local data sources
  sl.registerLazySingleton(
    () {
      final dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
          sendTimeout: const Duration(seconds: 20),
          baseUrl: dotenv.get('BASEURL'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          responseType: ResponseType.plain,
        ),
      );
      dio.interceptors.add(
        LogInterceptor(
            responseBody: kDebugMode ? true : false,
            requestBody: kDebugMode ? true : false,
            responseHeader: kDebugMode ? true : false,
            requestHeader: kDebugMode ? true : false,
            request: kDebugMode ? true : false,
            error: kDebugMode ? true : false),
      );

      return dio;
    },
  );

  sl.registerLazySingleton(() => DataConnectionChecker());

  sl.registerLazySingleton(
    () {
      IO.Socket socket = IO.io(dotenv.get('SOCKETURL'), <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': true,
      });

      return socket;
    },
  );

  //socket events
  sl.registerLazySingleton<SendMyLocationSocketEvent>(
        () => SendMyLocationSocketEventImpl(socket: sl(), networkInfo: sl()),
  );



  //datasource
  sl.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<GetCustomerCarsRemoteDataSource>(
    () => GetCustomerCarsRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );

  // bloc
  sl.registerLazySingleton(() => LoginBloc(loginRemoteDataSource: sl()));

  sl.registerLazySingleton(() => HomeBloc(
    sendMyLocationSocketEvent: sl()
  ));

  sl.registerLazySingleton(() => DetailsCustomerCarBloc());



  sl.registerLazySingleton(
      () => CustomerCarsBloc(getCustomerCarsRemoteDataSource: sl()));
}
