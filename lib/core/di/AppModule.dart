// ignore_for_file: non_constant_identifier_names

import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'dart:io' show Platform;

import '../../features/auth/data/data  source/remote/auth_api_service.dart';
import '../../features/orders/data/data  source/remote/orders_api_service.dart';



@module
abstract class AppModule {
  @preResolve
  Future<Dio> dio() async => Dio()
    ..options.headers['Accept'] = "*/*"
    ..options.headers['Content-Type'] = "application/json"
    ..options.headers['Accept-Encoding'] = "gzip, deflate, br"
    ..options.headers['Connection'] ="keep-alive"
    ..options.connectTimeout =
        const Duration(milliseconds: Duration.millisecondsPerMinute)
    ..options.receiveTimeout =
        const Duration(milliseconds: Duration.millisecondsPerMinute)
    ..options.validateStatus = (status) {
      return status! <= 500;
    }
  ..interceptors.add(
  AwesomeDioInterceptor(

  logRequestTimeout: false,
  logRequestHeaders: false,
  logResponseHeaders: false,

  // Optional, defaults to the 'log' function in the 'dart:developer' package.
  logger: debugPrint,
  ),
  );

  AuthApiService getAuthService(Dio dio) => AuthApiService(dio);
  OrdersApiService getOrdersService(Dio dio) => OrdersApiService(dio);

}
