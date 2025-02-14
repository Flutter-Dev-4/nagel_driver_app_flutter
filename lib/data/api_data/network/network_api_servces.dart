import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import '../response/app_exceptions.dart';
import 'base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);
    } on SocketException {
      // noInternetBool.value=true;
      throw InternetException('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  Future<dynamic> postApi(dynamic data, String url,dynamic headerss) async {
    if (kDebugMode) {
      print("urll $url");
      PrintLongString("data send post $data");
      print("headers post api $headerss");
    }
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: data,
        headers: headerss
      );


      if (kDebugMode) {
        print(" api service");
        PrintLongString(response.toString());
      }

      responseJson = returnResponse(response);
    } on SocketException {
      // noInternetBool.value=true;
      throw InternetException('No Internet');
      // Utils.snakBar("InterNet issue", "No Internet Connection");
    }
    if (kDebugMode) {
      print("Api Response :$responseJson");
    }
    return responseJson;
  }

  Future<dynamic> putApi(dynamic data, String url,dynamic headerss) async {
    if (kDebugMode) {
      print("urll $url");
      print(data);
      print("headers post api $headerss");
    }
    dynamic responseJson;
    try {
      final response = await http.put(
          Uri.parse(url),
          body: data,
          headers: headerss
      );


      if (kDebugMode) {
        print(" api service");
        PrintLongString(response.toString());
      }

      responseJson = returnResponse(response);
    } on SocketException {
      // noInternetBool.value=true;
      throw InternetException('No Internet');
      // Utils.snakBar("InterNet issue", "No Internet Connection");
    }
    if (kDebugMode) {
      print("Api Response :$responseJson");
    }
    return responseJson;
  }

  Future<dynamic> getHeaderApi(dynamic header, String url) async {
    if (kDebugMode) {
      print(url);
      print(header);
    }
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: header,
      );

      responseJson = returnResponse(response);
    } on SocketException {
      // noInternetBool.value=true;
      throw InternetException('No Internet');

      // Utils.snakBar("InterNet issue", "No Internet Connection");
    }
    if (kDebugMode) {
      print("Api Post header :$responseJson");
    }
    return responseJson;
  }

  Future<dynamic> getProfileApi(dynamic data, String url,dynamic headerss) async {
    if (kDebugMode) {
      print("urll $url");
      // print(data);
      print("headers get api $headerss");
    }
    dynamic responseJson;
    try {
      final response = await http.get(
          Uri.parse(url),
          //body: data,
          headers: headerss
      );

      print("herere");
      PrintLongString(response.toString());

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('No Internet');
      // Utils.snakBar("InterNet issue", "No Internet Connection");
    }
    if (kDebugMode) {
      print("Api Response :$responseJson");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        dynamic responseJson = jsonDecode(response.body);
        throw responseJson;


      case 206:
        dynamic responseJson = jsonDecode(response.body);
        throw responseJson;

      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 401:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 500:
        throw ServerNotResponding;


      default:
        throw FetchDataException("Error occur while Communication with server \n ${response.statusCode} \n ${response.body}");
    }
  }

  Future<Map<String, String>> headerSelection(int type) async {

    switch(type) {
      case 1: // with token
        // SharedPreferences sp = await SharedPreferences.getInstance();
        // String? token = sp.getString('token');
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer tokenhere',
        };
        return headers;

      case 2: // without token
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
        };
        return headers;

        default:
          final Map<String, String> headers = {
            'Content-Type': 'application/json',

          };
          return headers;
    }
  }

  Future<dynamic> deleteApi(String url,dynamic headerss) async {
    if (kDebugMode) {
      print("urll $url");
      print("headers post api $headerss");
    }
    dynamic responseJson;
    try {
      final response = await http.delete(
          Uri.parse(url),
          headers: headerss
      );


      if (kDebugMode) {
        print(" api service");
        PrintLongString(response.toString());
      }

      responseJson = returnResponse(response);
    } on SocketException {
      // noInternetBool.value=true;
      throw InternetException('No Internet');
      // Utils.snakBar("InterNet issue", "No Internet Connection");
    }
    if (kDebugMode) {
      print("Api Response :$responseJson");
    }
    return responseJson;
  }

}

void PrintLongString(String text) {
  final RegExp pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern
      .allMatches(text)
      .forEach((RegExpMatch match) => print(match.group(0)));
}
