import 'dart:developer';

import 'package:driver_app/application/services/ApiServices/api_services.dart';
import 'package:driver_app/application/services/SharedPreferences/app_preferences.dart';
import 'package:driver_app/data/AppData/data.dart';
import 'package:driver_app/data/api_data/app_url/app_url.dart';
import 'package:driver_app/domain/models/api_response_model.dart';

class ProfileRepo {

  ApiServices apiService;
  ProfileRepo({required this.apiService});



  Future<ApiResponse> getProfile() async {

    SharedPrefs.getUserToken();

    try{
      return await apiService.get(
        headers: {
          'authorization': 'Bearer ${Data.app.token}'
        },
        url: AppUrl.getProfile,);
    }catch(e){
      return ApiResponse(success: false,
        error: "${e.toString()}",
      );
    }
  }

  Future<ApiResponse> updateProfile(Map<String, dynamic> body) async {
    SharedPrefs.getUserToken();
    print("The body Data ${body.toString()}");
    try{
      return await apiService.put(
        headers: {
          'authorization': 'Bearer ${Data.app.token}'
        },
        url: AppUrl.updateProfile,
        body: body,
      ).then((val){
        log("the response is122 ${val.data.toString()}");
        return ApiResponse(success: true,
        );
      });
    }catch(e){
      return ApiResponse(success: false,
        error: "${e.toString()}",
      );
    }
  }

  Future<ApiResponse> changePassword(Map<String, dynamic> body) async {
    SharedPrefs.getUserToken();
    print("The body Data ${body.toString()}");
    try{
      return await apiService.post(
        headers: {
          'authorization': 'Bearer ${Data.app.token}'
        },
        url: AppUrl.changePassword,
        body: body,
      );
    }catch(e){
      return ApiResponse(success: false,
        error: "${e.toString()}",
      );
    }
  }

}