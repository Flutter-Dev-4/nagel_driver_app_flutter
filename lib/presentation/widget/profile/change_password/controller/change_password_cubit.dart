import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:driver_app/application/DiLayer/depdency_injection.dart';
import 'package:driver_app/application/services/ApiServices/api_services.dart';
import 'package:driver_app/data/repositories/profile_repo.dart';
import 'package:driver_app/presentation/widget/profile/controller/profile_text_field_controller.dart';
import 'package:meta/meta.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  ProfileRepo profileRepo = ProfileRepo(apiService: locator<ApiServices>());

  Future changePassword() async {
    print("Updated Pressed");
    emit(ChangePasswordLoading());
    profileRepo.changePassword(
        {
          "currentPassword": ProfileTextFieldController.instance.oldPassController.text,
          "newPassword": ProfileTextFieldController.instance.newPassController.text,
          "confirmPassword": ProfileTextFieldController.instance.confirmPassController.text
        }
    ).then((val){
      log("Val Response is ${val.data?['success'].toString()}");
      if(val.data?['success'] == true){
        emit(ChangePasswordSuccess(message: 'Password changed successfully'));
        log('Password changed successfully');
        ProfileTextFieldController.instance.oldPassController.clear();
        ProfileTextFieldController.instance.newPassController.clear();
        ProfileTextFieldController.instance.confirmPassController.clear();
      }else{
        emit(ChangePasswordError(error: val.data!['errormessage'].toString()));
      }
    });
  }

}
