class GetPGDetailResponse {
  dynamic pGModelForApp;
  PGModelForWeb? pGModelForWeb;
  dynamic pGModelforUpi;
  int? status;
  int? statuscode;
  String? msg;
  bool? isVersionValid;
  bool? isAppValid;
  int? checkID;
  bool? isPasswordExpired;
  dynamic mobileNo;
  dynamic emailID;
  dynamic outletName;
  bool? isLookUpFromAPI;
  bool? isDTHInfoCall;
  bool? isShowPDFPlan;
  dynamic sid;
  dynamic pCode;
  bool? isOTPRequired;
  bool? isBioMetricRequired;
  bool? isDeviceRequired;
  int? bioAuthType;
  bool? isRedirectToExternal;
  dynamic externalURL;
  bool? isResendAvailable;
  bool? isDTHInfo;
  bool? isRoffer;
  bool? isGreen;
  int? rid;
  bool? isHideService;
  bool? isBulkQRGeneration;
  bool? isSattlemntAccountVerify;
  bool? isEKYCForced;
  bool? isDrawOpImage;
  bool? isAutoVerifyVPA;
  bool? isCoin;
  bool? isB2cMembershipRePurchase;
  dynamic newsContent;

  GetPGDetailResponse({
    this.pGModelForApp,
    this.pGModelForWeb,
    this.pGModelforUpi,
    this.status,
    this.statuscode,
    this.msg,
    this.isVersionValid,
    this.isAppValid,
    this.checkID,
    this.isPasswordExpired,
    this.mobileNo,
    this.emailID,
    this.outletName,
    this.isLookUpFromAPI,
    this.isDTHInfoCall,
    this.isShowPDFPlan,
    this.sid,
    this.pCode,
    this.isOTPRequired,
    this.isBioMetricRequired,
    this.isDeviceRequired,
    this.bioAuthType,
    this.isRedirectToExternal,
    this.externalURL,
    this.isResendAvailable,
    this.isDTHInfo,
    this.isRoffer,
    this.isGreen,
    this.rid,
    this.isHideService,
    this.isBulkQRGeneration,
    this.isSattlemntAccountVerify,
    this.isEKYCForced,
    this.isDrawOpImage,
    this.isAutoVerifyVPA,
    this.isCoin,
    this.isB2cMembershipRePurchase,
    this.newsContent,
  });

  GetPGDetailResponse.fromJson(Map<String, dynamic> json) {
    pGModelForApp = json['pGModelForApp'];
    pGModelForWeb = json['pGModelForWeb'] != null
        ? PGModelForWeb.fromJson(json['pGModelForWeb'])
        : null;
    pGModelforUpi = json['pGModelforUpi'];
    status = json['status'];
    statuscode = json['statuscode'];
    msg = json['msg'];
    isVersionValid = json['isVersionValid'];
    isAppValid = json['isAppValid'];
    checkID = json['checkID'];
    isPasswordExpired = json['isPasswordExpired'];
    mobileNo = json['mobileNo'];
    emailID = json['emailID'];
    outletName = json['outletName'];
    isLookUpFromAPI = json['isLookUpFromAPI'];
    isDTHInfoCall = json['isDTHInfoCall'];
    isShowPDFPlan = json['isShowPDFPlan'];
    sid = json['sid'];
    pCode = json['pCode'];
    isOTPRequired = json['isOTPRequired'];
    isBioMetricRequired = json['isBioMetricRequired'];
    isDeviceRequired = json['isDeviceRequired'];
    bioAuthType = json['bioAuthType'];
    isRedirectToExternal = json['isRedirectToExternal'];
    externalURL = json['externalURL'];
    isResendAvailable = json['isResendAvailable'];
    isDTHInfo = json['isDTHInfo'];
    isRoffer = json['isRoffer'];
    isGreen = json['isGreen'];
    rid = json['rid'];
    isHideService = json['isHideService'];
    isBulkQRGeneration = json['isBulkQRGeneration'];
    isSattlemntAccountVerify = json['isSattlemntAccountVerify'];
    isEKYCForced = json['isEKYCForced'];
    isDrawOpImage = json['isDrawOpImage'];
    isAutoVerifyVPA = json['isAutoVerifyVPA'];
    isCoin = json['isCoin'];
    isB2cMembershipRePurchase = json['isB2cMembershipRePurchase'];
    newsContent = json['newsContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['pGModelForApp'] = pGModelForApp;
    if (pGModelForWeb != null) {
      data['pGModelForWeb'] = pGModelForWeb!.toJson();
    }
    data['pGModelforUpi'] = pGModelforUpi;
    data['status'] = status;
    data['statuscode'] = statuscode;
    data['msg'] = msg;
    data['isVersionValid'] = isVersionValid;
    data['isAppValid'] = isAppValid;
    data['checkID'] = checkID;
    data['isPasswordExpired'] = isPasswordExpired;
    data['mobileNo'] = mobileNo;
    data['emailID'] = emailID;
    data['outletName'] = outletName;
    data['isLookUpFromAPI'] = isLookUpFromAPI;
    data['isDTHInfoCall'] = isDTHInfoCall;
    data['isShowPDFPlan'] = isShowPDFPlan;
    data['sid'] = sid;
    data['pCode'] = pCode;
    data['isOTPRequired'] = isOTPRequired;
    data['isBioMetricRequired'] = isBioMetricRequired;
    data['isDeviceRequired'] = isDeviceRequired;
    data['bioAuthType'] = bioAuthType;
    data['isRedirectToExternal'] = isRedirectToExternal;
    data['externalURL'] = externalURL;
    data['isResendAvailable'] = isResendAvailable;
    data['isDTHInfo'] = isDTHInfo;
    data['isRoffer'] = isRoffer;
    data['isGreen'] = isGreen;
    data['rid'] = rid;
    data['isHideService'] = isHideService;
    data['isBulkQRGeneration'] = isBulkQRGeneration;
    data['isSattlemntAccountVerify'] = isSattlemntAccountVerify;
    data['isEKYCForced'] = isEKYCForced;
    data['isDrawOpImage'] = isDrawOpImage;
    data['isAutoVerifyVPA'] = isAutoVerifyVPA;
    data['isCoin'] = isCoin;
    data['isB2cMembershipRePurchase'] = isB2cMembershipRePurchase;
    data['newsContent'] = newsContent;
    return data;
  }
}
class PGModelForWeb {
  int? pgType;
  int? tid;
  int? statuscode;
  String? msg;
  String? url;
  dynamic paymentSessionId;
  dynamic intentString;
  bool? isIntentAllowed;
  dynamic phonePeMerchantID;
  dynamic phonePeAppID;
  bool? isFromUpi;
  dynamic checksum;
  dynamic endPoint;
  dynamic merchantUserId;
  dynamic merchantTransactionId;
  dynamic phonePeBase64Body;
  bool? phonePeIsRelease;
  dynamic envCode;
  dynamic industryType;
  KeyVals? keyVals;
  dynamic rPayRequest;
  dynamic paytmJSRequest;
  dynamic cashfreeResponse;
  dynamic cashFreeResponseForApp;

  PGModelForWeb({
    this.pgType,
    this.tid,
    this.statuscode,
    this.msg,
    this.url,
    this.paymentSessionId,
    this.intentString,
    this.isIntentAllowed,
    this.phonePeMerchantID,
    this.phonePeAppID,
    this.isFromUpi,
    this.checksum,
    this.endPoint,
    this.merchantUserId,
    this.merchantTransactionId,
    this.phonePeBase64Body,
    this.phonePeIsRelease,
    this.envCode,
    this.industryType,
    this.keyVals,
    this.rPayRequest,
    this.paytmJSRequest,
    this.cashfreeResponse,
    this.cashFreeResponseForApp,
  });

  PGModelForWeb.fromJson(Map<String, dynamic> json) {
    pgType = json['pgType'];
    tid = json['tid'];
    statuscode = json['statuscode'];
    msg = json['msg'];
    url = json['url'];
    paymentSessionId = json['paymentSessionId'];
    intentString = json['intentString'];
    isIntentAllowed = json['isIntentAllowed'];
    phonePeMerchantID = json['phonePeMerchantID'];
    phonePeAppID = json['phonePeAppID'];
    isFromUpi = json['isFromUpi'];
    checksum = json['checksum'];
    endPoint = json['endPoint'];
    merchantUserId = json['merchantUserId'];
    merchantTransactionId = json['merchantTransactionId'];
    phonePeBase64Body = json['phonePeBase64Body'];
    phonePeIsRelease = json['phonePeIsRelease'];
    envCode = json['envCode'];
    industryType = json['industryType'];
    keyVals = json['keyVals'] != null ? KeyVals.fromJson(json['keyVals']) : null;
    rPayRequest = json['rPayRequest'];
    paytmJSRequest = json['paytmJSRequest'];
    cashfreeResponse = json['cashfreeResponse'];
    cashFreeResponseForApp = json['cashFreeResponseForApp'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['pgType'] = pgType;
    data['tid'] = tid;
    data['statuscode'] = statuscode;
    data['msg'] = msg;
    data['url'] = url;
    data['paymentSessionId'] = paymentSessionId;
    data['intentString'] = intentString;
    data['isIntentAllowed'] = isIntentAllowed;
    data['phonePeMerchantID'] = phonePeMerchantID;
    data['phonePeAppID'] = phonePeAppID;
    data['isFromUpi'] = isFromUpi;
    data['checksum'] = checksum;
    data['endPoint'] = endPoint;
    data['merchantUserId'] = merchantUserId;
    data['merchantTransactionId'] = merchantTransactionId;
    data['phonePeBase64Body'] = phonePeBase64Body;
    data['phonePeIsRelease'] = phonePeIsRelease;
    data['envCode'] = envCode;
    data['industryType'] = industryType;
    if (keyVals != null) data['keyVals'] = keyVals!.toJson();
    data['rPayRequest'] = rPayRequest;
    data['paytmJSRequest'] = paytmJSRequest;
    data['cashfreeResponse'] = cashfreeResponse;
    data['cashFreeResponseForApp'] = cashFreeResponseForApp;
    return data;
  }
}
class KeyVals {
  String? encRequest;
  String? accessCode;

  KeyVals({this.encRequest, this.accessCode});

  KeyVals.fromJson(Map<String, dynamic> json) {
    encRequest = json['encRequest'];
    accessCode = json['access_code'];
  }

  Map<String, dynamic> toJson() {
    return {
      'encRequest': encRequest,
      'access_code': accessCode,
    };
  }
}

