import 'package:dartz/dartz.dart';
import 'package:onyx/features/orders/data/models/orders_model.dart';

import '../../data/models/status_model.dart';

abstract class OrdersRepository {



  Future<Either<String, OrdersModel>> getOrders(id);





  Future<Either<String, StatusModel>> getStatus(id);

}