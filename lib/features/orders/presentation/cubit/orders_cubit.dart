import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:onyx/features/orders/domain/entities/order_data.dart';

import '../../data/models/status_model.dart';
import '../../domain/usecase/orders_use_case.dart';

part 'orders_state.dart';
@injectable
class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this._ordersUseCase) : super(OrdersInitial());

  final OrdersUseCase _ordersUseCase;

  List<OrderData> listOrderNew = [];
  List<OrderData> listOrderOther = [];
  StatusModel? statusModel;


  init() async {

    await Future.wait([
      getStatus(),
      getOrders()
    ]);
  }
  Future<void> getOrders() async {

    print("orders");
    emit(OrdersLoadingState());
    var result = await _ordersUseCase.callOrders();

    result.fold((l) {
      emit(OrdersErorrState());
      print("error");
    }, (r) {

      print("suss");
      listOrderNew = r.data!.deliveryBills!.where((element) =>  element.dLVRYSTATUSFLG =="0")
          .map((e) => OrderData(
              orderNumber: e.bILLNO,
              status:"New",

           date: e.bILLDATE??"",
           price: double.parse(e.bILLAMT??"").round().toString(),
              statusId: e.dLVRYSTATUSFLG))
          .toList();


      listOrderOther= r.data!.deliveryBills!.where((element) =>  element.dLVRYSTATUSFLG !="0")
          .map((e) => OrderData(
          orderNumber: e.bILLNO,
          status: e.dLVRYSTATUSFLG == "1" ?statusModel?.data?.deliveryStatusTypes![0].tYPNM :e.dLVRYSTATUSFLG == "2"? statusModel?.data?.deliveryStatusTypes![1].tYPNM:
          statusModel?.data?.deliveryStatusTypes![2].tYPNM
          ,

//element.tYPNO == e.dLVRYSTATUSFLG,


          date: e.bILLDATE??"",
          price: double.parse(e.bILLAMT??"").round().toString(),
          statusId: e.dLVRYSTATUSFLG))
          .toList();


      print(listOrderOther.toString());
      emit(OrdersSussState());
    });
  }



  Future<void> getStatus() async {
    var result = await _ordersUseCase.callTyps();

    result.fold((l) {

      debugPrint(l.toString());
    }, (r) {


      statusModel = r;
    });
  }
}
