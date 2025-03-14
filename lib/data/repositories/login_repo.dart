import 'dart:convert';
import 'dart:developer';

import 'package:driver_app/application/services/ApiServices/api_services.dart';
import 'package:driver_app/data/api_data/app_url/app_url.dart';
import 'package:driver_app/domain/models/api_response_model.dart';
import 'package:driver_app/presentation/widget/auth/login/controller/login_textfield_controller.dart';

class LoginRepo {
  ApiServices apiService;

  LoginRepo({required this.apiService});

  Future<ApiResponse> login() async {

   final Map<String, dynamic> body = {
      "email": LoginTextfieldController.instance.emailController.text,
      "password": LoginTextfieldController.instance.passwordController.text
    };

    log("🚀 Sending API Request...");
    log("📌 Request URL: ${AppUrl.loginApi}");
    log("📌 Request Body: ${jsonEncode(body)}");

    try {
      return await apiService.post(
        url: AppUrl.loginApi,
        body: body,
      );
    } catch (e) {
      log("❌ API Error: ${e.toString()}");
      return ApiResponse(success: false, error: e.toString());
    }
  }

}
