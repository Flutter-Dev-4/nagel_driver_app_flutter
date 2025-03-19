import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:driver_app/application/DiLayer/depdency_injection.dart';
import 'package:driver_app/application/services/ApiServices/api_services.dart';
import 'package:driver_app/data/repositories/order_detail_repo.dart';
import 'package:meta/meta.dart';

part 'move_start_state.dart';

class MoveStartCubit extends Cubit<MoveStartState> {
  MoveStartCubit() : super(MoveStartInitial());

  OrderDetailRepo orderDetailRepo = OrderDetailRepo(apiService: locator<ApiServices>());

  Future moveStart(int orderId, double lat, double long) async {
    print("Move Started Pressed");
    emit(MoveStartLoading());
    orderDetailRepo.moveStart(
        {
          "orderId": orderId,
          "latitude":lat,
          "longitude":long
        }
    ).then((val){
      log("Val Response is ${val.data?['success'].toString()}");
      if(val.data?['success'] == true){
        emit(MoveStartSuccess(message: 'Move Started'));
        log('Move Started');
      }else{
        emit(MoveStartError(error: val.data!['errormessage'].toString()));
      }
    });
  }
}
