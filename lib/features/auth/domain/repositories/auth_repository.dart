

import 'package:dartz/dartz.dart';
import 'package:onyx/features/auth/data/models/login_model.dart';

abstract class AuthRepository {





  Future<Either<String, LoginModel>> login(String ? userId ,String ? password );




}