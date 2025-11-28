class ChangePassPinResponse {
  int? statuscode;
  String? msg;
  bool? isVersionValid;
  bool? isAppValid;
  int? checkID;
  bool? isPasswordExpired;
  String? mobileNo;
  String? emailID;
  String? outletName;
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
  String? externalURL;
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

  ChangePassPinResponse({
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

  ChangePassPinResponse.fromJson(Map<String, dynamic> json) {
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
    return {
      'statuscode': statuscode,
      'msg': msg,
      'isVersionValid': isVersionValid,
      'isAppValid': isAppValid,
      'checkID': checkID,
      'isPasswordExpired': isPasswordExpired,
      'mobileNo': mobileNo,
      'emailID': emailID,
      'outletName': outletName,
      'isLookUpFromAPI': isLookUpFromAPI,
      'isDTHInfoCall': isDTHInfoCall,
      'isShowPDFPlan': isShowPDFPlan,
      'sid': sid,
      'pCode': pCode,
      'isOTPRequired': isOTPRequired,
      'isBioMetricRequired': isBioMetricRequired,
      'isDeviceRequired': isDeviceRequired,
      'bioAuthType': bioAuthType,
      'isRedirectToExternal': isRedirectToExternal,
      'externalURL': externalURL,
      'isResendAvailable': isResendAvailable,
      'isDTHInfo': isDTHInfo,
      'isRoffer': isRoffer,
      'isGreen': isGreen,
      'rid': rid,
      'isHideService': isHideService,
      'isBulkQRGeneration': isBulkQRGeneration,
      'isSattlemntAccountVerify': isSattlemntAccountVerify,
      'isEKYCForced': isEKYCForced,
      'isDrawOpImage': isDrawOpImage,
      'isAutoVerifyVPA': isAutoVerifyVPA,
      'isCoin': isCoin,
      'isB2cMembershipRePurchase': isB2cMembershipRePurchase,
      'newsContent': newsContent,
    };
  }
}
