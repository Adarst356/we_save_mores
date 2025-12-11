import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
      final box = GetStorage();

      request.headers['appID'] = '6072874e1f4b7000991915fa914318ed';
      request.headers['version'] = '5.0';
      request.headers['domain']= 'admin.wesavemore.in';

      request.headers["sessionID"] = box.read("sessionID")?.toString() ?? "";
      request.headers["userID"] = box.read("userID")?.toString() ?? "";
      request.headers['session'] = box.read("session")?.toString() ?? "";

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
  Future<Response> getReferralContent(Object body) async {
    return await post("GetAppRefferalContent", body);
  }
  Future<Response> getCompanyProfile(Object body) async {
    return await post("GetCompanyProfile", body);
  }
  Future<Response> getReport(Object body) async {
    return await post("RechargeReport", body);
  }
  Future<Response> getLogout(Object body) async {
    return await post("Logout", body);
  }
  Future<Response> getProfile(Object body) async {
    return await post("GetProfile", body);
  }
  Future<Response> getChangePassPin(Object body) async {
    return await post("ChangePinOrPassword", body);
  }
  Future<Response> getUpdateProfile(Object body) async {
    return await post("UpdateProfile", body);
  }
  Future<Response> getBalance(Object body) async {
    return await post("GetBalance", body);
  }
  Future<Response> getPaymentMethod(Object body) async {
    return await post("GetPaymentMode", body); // check karna hai
  }
  Future<Response> getPGDetails(Object body) async {
    return await post("GetPGDetail", body); //ye nhi hua avi
  }
  Future<Response> getNewsDetail(Object body) async {
    return await post("GetNews", body);
  }
  Future<Response> getBannerDetail(Object body) async {
    return await post("GetBanner", body);
  }
  Future<Response> getUserDayBook(Object body) async {
    return await post("UserDaybook", body);
  }
  Future<Response> getLedgerReport(Object body) async {
    return await post("LedgerReport", body); //avi nhi laga hai
  }

  Future<Response> getRedeemCouponList(Object body) async {
    return await post("RedeemCouponList", body); //avi nhi laga hai
  }
  Future<Response> getAppNotification(Object body) async {
    return await post("GetAppNotification", body); //avi nhi laga hai
  }
  Future<Response> getOpType(Object body) async {
    return await post("GetOpTypes", body);
  }
  Future<Response> getNumberList(Object body) async {
    return await post("GetNumberList", body);
  }

}
