import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:onyx/core/storage/local.dart';

import 'package:onyx/features/orders/data/models/orders_model.dart';

import 'package:onyx/features/orders/data/models/status_model.dart';

import '../../domain/repositories/orders_repository.dart';
import '../data  source/remote/orders_api_service.dart';

@Injectable(as: OrdersRepository)
class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersApiService _apiService;

  OrdersRepositoryImpl(this._apiService);
  @override
  Future<Either<String, OrdersModel>> getOrders(id) async {
    try {
      final httpResponse = await _apiService.getOrders(requestBody: {
        "Value": {
          "P_LANG_NO": "2",
          "P_DLVRY_NO":  LocalStorage.box.read("userId"),
          "P_BILL_SRL": "",
          "P_PRCSSD_FLG": ""
        }
      });

      if (kDebugMode) {
        print("order code : ${httpResponse.response.statusCode}");
      }

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return right(httpResponse.data);
      } else {
        print("e3");

        return left(httpResponse.data.result?.errMsg ?? "");
      }
    } catch (e) {
      if (e is DioError) {
        print("e2");
        return left(e.response?.data.result?.errMsg ?? "wrong data");

      } else {

        print("e1 : $e");
        return left('network error');
      }
    }
  }

  @override
  Future<Either<String, StatusModel>> getStatus(id) async {
    try {
      final httpResponse = await _apiService.getStatusTypes(requestBody: {
        "Value": {
          "P_LANG_NO": "2",
        }
      });

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return right(httpResponse.data);
      } else {
        return left(httpResponse.data.result?.errMsg ?? "");
      }
    } catch (e) {
      if (e is DioError) {
        return left(e.response?.data.result?.errMsg ?? "wrong data");
      } else {
        return left('network error');
      }
    }
  }
}
