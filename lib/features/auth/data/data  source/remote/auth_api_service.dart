


import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/helpers/constant.dart';
import '../../models/login_model.dart';
part 'auth_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST('OnyxDeliveryService/Service.svc/CheckDeliveryLogin')
  Future<HttpResponse<LoginModel>> login({
      @Body()  required dynamic requestBody
  });


}