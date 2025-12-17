class GetRNPRofferResponse {
  dynamic data;
  List<RofferData>? rofferData;
  dynamic dthciData;
  dynamic dthhrData;
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

  GetRNPRofferResponse({
    this.data,
    this.rofferData,
    this.dthciData,
    this.dthhrData,
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

  GetRNPRofferResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'];

    if (json['rofferData'] != null) {
      rofferData = <RofferData>[];
      json['rofferData'].forEach((v) {
        rofferData!.add(RofferData.fromJson(v));
      });
    }

    dthciData = json['dthciData'];
    dthhrData = json['dthhrData'];
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
    final Map<String, dynamic> json = <String, dynamic>{};

    json['data'] = data;
    if (rofferData != null) {
      json['rofferData'] = rofferData!.map((v) => v.toJson()).toList();
    }

    json['dthciData'] = dthciData;
    json['dthhrData'] = dthhrData;
    json['statuscode'] = statuscode;
    json['msg'] = msg;
    json['isVersionValid'] = isVersionValid;
    json['isAppValid'] = isAppValid;
    json['checkID'] = checkID;
    json['isPasswordExpired'] = isPasswordExpired;
    json['mobileNo'] = mobileNo;
    json['emailID'] = emailID;
    json['outletName'] = outletName;
    json['isLookUpFromAPI'] = isLookUpFromAPI;
    json['isDTHInfoCall'] = isDTHInfoCall;
    json['isShowPDFPlan'] = isShowPDFPlan;
    json['sid'] = sid;
    json['pCode'] = pCode;
    json['isOTPRequired'] = isOTPRequired;
    json['isBioMetricRequired'] = isBioMetricRequired;
    json['isDeviceRequired'] = isDeviceRequired;
    json['bioAuthType'] = bioAuthType;
    json['isRedirectToExternal'] = isRedirectToExternal;
    json['externalURL'] = externalURL;
    json['isResendAvailable'] = isResendAvailable;
    json['isDTHInfo'] = isDTHInfo;
    json['isRoffer'] = isRoffer;
    json['isGreen'] = isGreen;
    json['rid'] = rid;
    json['isHideService'] = isHideService;
    json['isBulkQRGeneration'] = isBulkQRGeneration;
    json['isSattlemntAccountVerify'] = isSattlemntAccountVerify;
    json['isEKYCForced'] = isEKYCForced;
    json['isDrawOpImage'] = isDrawOpImage;
    json['isAutoVerifyVPA'] = isAutoVerifyVPA;
    json['isCoin'] = isCoin;
    json['isB2cMembershipRePurchase'] = isB2cMembershipRePurchase;
    json['newsContent'] = newsContent;

    return json;
  }
}

class RofferData {
  String? amount;
  String? description;

  RofferData({this.amount, this.description});

  RofferData.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'description': description,
    };
  }
}
