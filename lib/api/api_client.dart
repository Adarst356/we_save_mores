import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../utils/constant.dart';
import '../utils/printer.dart';

const baseUrl = baseUrls;

class GetConnectApiClient extends GetConnect with Printer {
  GetConnectApiClient._() {
    onInit();
  }

  static GetConnectApiClient? _instance;

  static GetConnectApiClient get instance {
    _instance ??= GetConnectApiClient._();
    return _instance!;
  }

  @override
  void onInit() {
    httpClient.baseUrl = baseUrls;
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 30);


    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['appID'] = '6072874e1f4b7000991915fa914318ed';
      request.headers['version'] = '5.0';
      request.headers['domain']= 'admin.wesavemore.in';
      if (kDebugMode) printRequest(request);
      return request;
    });

    httpClient.addResponseModifier((request, response) {
      if (kDebugMode) printResponse(response, request);
      return response;
    });
    super.onInit();
  }

  Future<Response> getLogin(Object body) async {
    return await post("Login", body);
  }
  Future<Response> getSignup(Object body) async {
    return await post("Signup", body);
  }

  Future<Response> getForgetPass(Object body) async {
    return await post("ForgetPassword", body);
  }


  Future<Response> getProductDetailsId(int id) async {
    return await post("ProductDetails/$id", {});
  }
}
