import 'package:driver_app/application/services/ApiServices/api_services.dart';
import 'package:driver_app/application/services/SharedPreferences/app_preferences.dart';
import 'package:driver_app/data/AppData/data.dart';
import 'package:driver_app/data/api_data/app_url/app_url.dart';
import 'package:driver_app/domain/models/api_response_model.dart';

class HomeRepo {

  ApiServices apiService;
  HomeRepo({required this.apiService});



  Future<ApiResponse> myOrders() async {

    SharedPrefs.getUserToken();

    try{
      return await apiService.get(
        headers: {
          'authorization': 'Bearer ${Data.app.token}'
        },
        url: AppUrl.myOrders,);
    }catch(e){
      return ApiResponse(success: false,
        error: "${e.toString()}",
      );
    }
  }

}