

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:onyx/features/auth/data/models/login_model.dart';

import '../../domain/repositories/auth_repository.dart';
import '../data  source/remote/auth_api_service.dart';

@Injectable(as: AuthRepository)
class AuthRepoImpl implements AuthRepository{

  final AuthApiService _authApiService;

  AuthRepoImpl(this._authApiService);
  @override
  Future<Either<String, LoginModel>> login(String? userId, String? password) async {
    try {
      final httpResponse =
          await _authApiService.login( requestBody: {

            "Value": {
              "P_LANG_NO": "4",
              "P_DLVRY_NO": userId,
              "P_PSSWRD": password
            }


          });


      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return right(httpResponse.data);
      }else{

        return left(httpResponse.data.result?.errMsg??"");
      }
    } catch (e) {

      if (e is DioError) {
        return left(e.response?.data.result?.errMsg??"wrong data");

      } else {
        return left('network error');

  }


    }
  }



}