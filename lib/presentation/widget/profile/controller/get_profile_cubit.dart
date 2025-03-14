import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:driver_app/application/DiLayer/depdency_injection.dart';
import 'package:driver_app/application/services/ApiServices/api_services.dart';
import 'package:driver_app/data/repositories/profile_repo.dart';
import 'package:driver_app/domain/models/get_profile_model.dart';
import 'package:meta/meta.dart';

part 'get_profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  GetProfileCubit() : super(GetProfileInitial());

  ProfileRepo profileRepo = ProfileRepo(apiService: locator<ApiServices>());
  Future getProfile() async {
    emit(GetProfileLoading());
    profileRepo.getProfile().then((val){
      log("Val Response is ${val.data.toString()}");
      if(val.success == true){
        GetProfileModel getProfileModel = GetProfileModel.fromJson(val.data!['data']);
        emit(GetProfileSuccess(getProfileModel: getProfileModel));
      }else{
        emit(GetProfileError(error: "error"));
      }
    });
  }
}
