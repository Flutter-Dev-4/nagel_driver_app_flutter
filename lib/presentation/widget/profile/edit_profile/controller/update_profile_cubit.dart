import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:driver_app/application/DiLayer/depdency_injection.dart';
import 'package:driver_app/application/services/ApiServices/api_services.dart';
import 'package:driver_app/data/repositories/profile_repo.dart';
import 'package:driver_app/presentation/widget/profile/controller/profile_text_field_controller.dart';
import 'package:meta/meta.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  ProfileRepo profileRepo = ProfileRepo(apiService: locator<ApiServices>());

  Future updateProfile() async {
    print("Updated Pressed");
    emit(UpdateProfileLoading());
    profileRepo.updateProfile(
        {
          "name": ProfileTextFieldController.instance.firstNameController.text,
          "profilePic":"https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWFsZSUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D"
        }
    ).then((val){
      log("Val Response is ${val.data.toString()}");
      if(val.success == true){
        emit(UpdateProfileSuccess(message: 'Successfully Updated'));
        log('Updated Successfully');
      }else{
        emit(UpdateProfileError(error: "error"));
      }
    });
  }
}
