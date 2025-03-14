import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:driver_app/domain/models/api_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';

class ApiServices {
  static final ApiServices _instance = ApiServices._internal();

  ApiServices get instance => _instance;
  ApiServices._internal();
  factory ApiServices() {
    return _instance;
  }
   Future<ApiResponse> get(
      {required String url,
      bool retry = true,
      Map<String, String>? headers}) async {

    log("The APi Data Is ${url} and headers ${headers}");
    const r = RetryOptions(maxAttempts: 5, delayFactor: Duration(seconds: 10));

    try {
      final response = retry
          ? await r.retry(
              () => http
                  .get(Uri.parse(url), headers: headers)
                  .timeout(const Duration(seconds: 5)),
              retryIf: (e) => e is TimeoutException || e is SocketException,
            )
          : await http
              .get(Uri.parse(url), headers: headers)
              .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        return ApiResponse(
          success: true,
          data: jsonDecode(response.body),
        );
      } else {
        return ApiResponse(
          success: false,
          error: response.reasonPhrase,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<ApiResponse> post({
    bool retry = true,
    required String url,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    const r = RetryOptions(maxAttempts: 5, delayFactor: Duration(seconds: 10));

    final Map<String, String> defaultHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    final Map<String, String> finalHeaders = {...?headers, ...defaultHeaders}; // Merge headers

    log("🚀 API POST Request: $url");
    log("📌 Headers: $finalHeaders");
    log("📌 Body: ${jsonEncode(body)}"); // Ensure phone exists

    try {
      final response = retry
          ? await r.retry(
            () => http
            .post(
          Uri.parse(url),
          headers: finalHeaders,
          body: jsonEncode(body), // Encode body properly
        )
            .timeout(const Duration(seconds: 30)),
        retryIf: (e) => e is TimeoutException || e is SocketException,
        onRetry: (e) => log('⚠️ Retrying due to: $e'),
      )
          : await http
          .post(
        Uri.parse(url),
        headers: finalHeaders,
        body: jsonEncode(body),
      )
          .timeout(const Duration(seconds: 30));

      log("✅ Response Status: ${response.statusCode}");
      log("✅ Response Body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse(
          success: true,
          data: jsonDecode(response.body),
        );
      } else {
        return ApiResponse(
          success: false,
          data: jsonDecode(response.body),
          error: response.reasonPhrase,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return _handleError(e);
    }
  }


  Future<ApiResponse> put(
      {bool retry = true,
      required String url,
      required Map<String, dynamic> body,
      Map<String, String>? headers}) async {
    const r = RetryOptions(maxAttempts: 5, delayFactor: Duration(seconds: 10));
    try {
      final response = retry
          ? await r.retry(
              () => http
                  .put(
                    Uri.parse(url),
                    headers: headers,
                    body: body,
                  )
                  .timeout(const Duration(seconds: 30)),
              retryIf: (e) => e is TimeoutException || e is SocketException,
              onRetry: (e) => debugPrint('Retrying due to: $e'),
            )
          : await http
              .put(
                Uri.parse(url),
                headers: headers,
                body: jsonEncode(body),
              )
              .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return ApiResponse(
          success: true,
          data: jsonDecode(response.body),
        );
      } else {
        return ApiResponse(
          success: false,
          error: response.reasonPhrase,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<ApiResponse> putMultipart(
      {bool retry = true,
      required String url,
      Map<String, String>? fields,
      List<http.MultipartFile>? files,
      Map<String, String>? headers}) async {
    const r = RetryOptions(maxAttempts: 5, delayFactor: Duration(seconds: 10));

    var request = http.MultipartRequest('PUT', Uri.parse(url));
    if (headers != null) {
      request.headers.addAll(headers);
    }
    if (fields != null) {
      request.fields.addAll(fields);
    }
    if (files != null) {
      request.files.addAll(files);
    }

    try {
      final response = retry
          ? await r.retry(
              () => request.send().timeout(const Duration(seconds: 30)),
              retryIf: (e) => e is TimeoutException || e is SocketException,
              onRetry: (e) => debugPrint('Retrying due to: $e'),
            )
          : await request.send().timeout(const Duration(seconds: 30));

      final responseBody = await http.Response.fromStream(response);
      if (response.statusCode == 200) {
        return ApiResponse(
          success: true,
          data: jsonDecode(responseBody.body),
        );
      } else {
        return ApiResponse(
          success: false,
          error: response.reasonPhrase,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<ApiResponse> postMultipart(
      {bool retry = true,
      required String url,
      required Map<String, String> fields,
      required List<http.MultipartFile> files,
      Map<String, String>? headers}) async {
    const r = RetryOptions(maxAttempts: 5, delayFactor: Duration(seconds: 10));

    var request = http.MultipartRequest('POST', Uri.parse(url));
    if (headers != null) {
      request.headers.addAll(headers);
    }
    request.fields.addAll(fields);
    request.files.addAll(files);

    try {
      final response = retry
          ? await r.retry(
              () => request.send().timeout(const Duration(seconds: 30)),
              retryIf: (e) => e is TimeoutException || e is SocketException,
              onRetry: (e) => debugPrint('Retrying due to: $e'),
            )
          : await request.send().timeout(const Duration(seconds: 30));

      final responseBody = await http.Response.fromStream(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse(
          success: true,
          data: jsonDecode(responseBody.body),
        );
      } else {
        return ApiResponse(
          success: false,
          error: response.reasonPhrase,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return _handleError(e);
    }
  }

  ApiResponse _handleError(dynamic e) {
    if (e is SocketException) {
      return ApiResponse(
          success: false, error: 'No Internet Connection', statusCode: 30);
    } else if (e is TimeoutException) {
      return ApiResponse(success: false, error: 'Time Out', statusCode: 31);
    } else if (e is HttpException) {
      return ApiResponse(
          success: false, error: 'Invalid Request', statusCode: 32);
    } else {
      return ApiResponse(
          success: false, error: 'Unknown error', statusCode: 33);
    }
  }
}
