


import 'package:dio/dio.dart';
import 'package:onyx/features/orders/data/models/orders_model.dart';
import 'package:onyx/features/orders/data/models/status_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/helpers/constant.dart';
part 'orders_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class OrdersApiService {
  factory OrdersApiService(Dio dio, {String baseUrl}) = _OrdersApiService;


@POST("OnyxDeliveryService/Service.svc/GetDeliveryBillsItems")
Future<HttpResponse<OrdersModel>> getOrders({
  @Body()  required dynamic requestBody
});



@POST("OnyxDeliveryService/Service.svc/GetDeliveryStatusTypes")
Future<HttpResponse<StatusModel>> getStatusTypes({
@Body()  required dynamic requestBody
});




}