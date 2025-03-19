import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:driver_app/application/DiLayer/depdency_injection.dart';
import 'package:driver_app/application/services/ApiServices/api_services.dart';
import 'package:driver_app/application/services/SharedPreferences/app_preferences.dart';
import 'package:driver_app/data/repositories/login_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginRepo loginRepo = LoginRepo(apiService: locator<ApiServices>());
  Future<void> loginUser() async {

    emit(LoginLoading());

    try {
      final val = (await loginRepo.login());

      log("✅ API Response: ${val.data}");

      if (val.success == true) {
        SharedPrefs.setLoginToken(val.data?['data']['token'].toString() ?? '');
        log("Here is token ${val.data?['data']['token'].toString()}");
        emit(LoginSuccess(message: val.data?['data']['message'].toString() ?? "Success"));

      } else {
        emit(LoginError(error: val.data?['errormessage'].toString() ?? "Unknown Error"));
      }
    } catch (e) {
      emit(LoginError(error: "Exception: ${e.toString()}"));
    }
  }

}
