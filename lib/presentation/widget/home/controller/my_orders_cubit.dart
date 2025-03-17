import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:driver_app/application/DiLayer/depdency_injection.dart';
import 'package:driver_app/application/services/ApiServices/api_services.dart';
import 'package:driver_app/data/repositories/home_repo.dart';
import 'package:driver_app/domain/models/get_my_orders_model.dart';
import 'package:meta/meta.dart';

part 'my_orders_state.dart';

class MyOrdersCubit extends Cubit<MyOrdersState> {
  MyOrdersCubit() : super(MyOrdersInitial());


  HomeRepo homeRepo = HomeRepo(apiService: locator<ApiServices>());

  Future<void> getMyOrders() async {
    try {
      emit(MyOrdersLoading());

      final val = await homeRepo.myOrders();  // Awaiting the response properly

      log("Val Response is ${val.data.toString()}");

      if (val.success == true) {
        final ordersData = val.data?['data']?['orders'];

        if (ordersData != null && ordersData is List) {
          List<Orders> getMyOrdersModel =
          ordersData.map((e) => Orders.fromJson(e)).toList();

          emit(MyOrdersSuccess(myOrdersList: getMyOrdersModel));
        } else {
          emit(MyOrdersError(error: "Invalid orders data"));
        }
      } else {
        emit(MyOrdersError(error: val.data?['errormessage']?.toString() ?? "Unknown error"));
      }
    } catch (e, stackTrace) {
      log("Error in getMyOrders: $e", stackTrace: stackTrace);
      emit(MyOrdersError(error: e.toString()));
    }
  }
}
