import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:onyx/features/auth/data/models/login_model.dart';

import '../repositories/auth_repository.dart';

@injectable
class LoginUseCase  {
  final AuthRepository _authRepo;

  LoginUseCase(this._authRepo);

  @override
  Future<Either<String, LoginModel>> callLogin(
      { String? userId, String? password}) async {
    return await _authRepo.login(userId, password);
  }
}