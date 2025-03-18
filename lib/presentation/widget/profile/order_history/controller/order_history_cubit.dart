import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:driver_app/application/DiLayer/depdency_injection.dart';
import 'package:driver_app/application/services/ApiServices/api_services.dart';
import 'package:driver_app/data/repositories/profile_repo.dart';
import 'package:driver_app/domain/models/order_history_model.dart';
import 'package:meta/meta.dart';

part 'order_history_state.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  OrderHistoryCubit() : super(OrderHistoryInitial());

  ProfileRepo profileRepo = ProfileRepo(apiService: locator<ApiServices>());

  Future<void> orderHistory() async {
    try {
      emit(OrderHistoryLoading());

      final val = await profileRepo.orderHistory();

      log("Val Response is ${val.data.toString()}");

      if (val.success == true) {
        final ordersData = val.data?['data']?['orders'];

        if (ordersData != null && ordersData is List) {
          List<OrderHistory> orderHistory =
          ordersData.map((e) => OrderHistory.fromJson(e)).toList();

          emit(OrderHistorySuccess(orderHistory: orderHistory));
        } else {
          emit(OrderHistoryError(error: "Invalid orders data"));
        }
      } else {
        emit(OrderHistoryError(error: val.data?['errormessage']?.toString() ?? "Unknown error"));
      }
    } catch (e, stackTrace) {
      log("Error in getMyOrders: $e", stackTrace: stackTrace);
      emit(OrderHistoryError(error: e.toString()));
    }
  }

}
