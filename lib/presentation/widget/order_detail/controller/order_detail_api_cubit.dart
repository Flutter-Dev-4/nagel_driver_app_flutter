import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:driver_app/application/DiLayer/depdency_injection.dart';
import 'package:driver_app/application/services/ApiServices/api_services.dart';
import 'package:driver_app/data/repositories/order_detail_repo.dart';
import 'package:driver_app/domain/models/order_detail_model.dart';
import 'package:meta/meta.dart';

part 'order_detail_api_state.dart';

class OrderDetailApiCubit extends Cubit<OrderDetailApiState> {
  OrderDetailApiCubit() : super(OrderDetailApiInitial());

  OrderDetailRepo orderDetailRepo = OrderDetailRepo(apiService: locator<ApiServices>());
  Future orderDetail() async {
    emit(OrderDetailApiLoading());
    orderDetailRepo.orderDetail().then((val){
      log("Val Response is ${val.data.toString()}");
      if(val.success == true){
        OrderDetailModel orderDetailModel = OrderDetailModel.fromJson(val.data!['data']);
        emit(OrderDetailApiSuccess(orderDetailModel: orderDetailModel));
      }else{
        emit(OrderDetailApiError(error: val.data!['errormessage'].toString()));
      }
    });
  }

}
