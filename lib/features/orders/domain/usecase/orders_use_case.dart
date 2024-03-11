import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:onyx/features/auth/data/models/login_model.dart';
import 'package:onyx/features/orders/data/models/orders_model.dart';
import 'package:onyx/features/orders/data/models/status_model.dart';

import '../repositories/orders_repository.dart';

@injectable
class OrdersUseCase  {
  final OrdersRepository _ordersRepository;

  OrdersUseCase(this._ordersRepository);

  @override
  Future<Either<String, StatusModel>> callTyps() async {
    return await _ordersRepository.getStatus(0);
  }


  Future<Either<String, OrdersModel>> callOrders() async {
    return await _ordersRepository.getOrders(0);
  }
}