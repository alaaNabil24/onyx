import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/storage/local.dart';
import '../../../domain/usecase/login_user_case.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._loginUseCase) : super(AuthInitial());

final  LoginUseCase _loginUseCase;
 TextEditingController userIdController = TextEditingController();
 TextEditingController passwordController = TextEditingController();



 void login(String userId, String password) async{

emit(LoginLoadingState());
 var   result  = await _loginUseCase.callLogin(userId:  userId,  password: password );

result.fold((e) {


  emit(LoginErrorState(e));
}, (r) {


  LocalStorage.box.write("name", r.data?.deliveryName??"");
  LocalStorage.setUserId(userId);
  emit(LoginSuccessState());
});
  
 }

}
