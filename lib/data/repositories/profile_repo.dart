import 'dart:developer';

import 'package:driver_app/application/services/ApiServices/api_services.dart';
import 'package:driver_app/data/api_data/app_url/app_url.dart';
import 'package:driver_app/domain/models/api_response_model.dart';

class ProfileRepo {

  ApiServices apiService;
  ProfileRepo({required this.apiService});



  Future<ApiResponse> getProfile() async {
    try{
      return await apiService.get(
        headers: {
          'authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZW1haWwiOiJkcml2ZXJAZ21haWwuY29tIiwicm9sZSI6ImRyaXZlciIsImlhdCI6MTc0MTg1NzM1NSwiZXhwIjoxNzQ0NDQ5MzU1fQ.srjdh0FeOWamyKkffJtWEBuJG0Cg21tAKK5_NPcHcXs'
        },
        url: AppUrl.getProfile,);
    }catch(e){
      return ApiResponse(success: false,
        error: "${e.toString()}",
      );
    }
  }

  Future<ApiResponse> updateProfile(Map<String, dynamic> body) async {
    print("The body Data ${body.toString()}");
    try{
      return await apiService.put(
        headers: {
          'authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZW1haWwiOiJkcml2ZXJAZ21haWwuY29tIiwicm9sZSI6ImRyaXZlciIsImlhdCI6MTc0MTg1NzM1NSwiZXhwIjoxNzQ0NDQ5MzU1fQ.srjdh0FeOWamyKkffJtWEBuJG0Cg21tAKK5_NPcHcXs'
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

}