class RedeemCouponListResponse {
  dynamic result;
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

  RedeemCouponListResponse(
      {this.result,
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
        this.newsContent});

  RedeemCouponListResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'];
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
    data['result'] = this.result;
    data['statuscode'] = this.statuscode;
    data['msg'] = this.msg;
    data['isVersionValid'] = this.isVersionValid;
    data['isAppValid'] = this.isAppValid;
    data['checkID'] = this.checkID;
    data['isPasswordExpired'] = this.isPasswordExpired;
    data['mobileNo'] = this.mobileNo;
    data['emailID'] = this.emailID;
    data['outletName'] = this.outletName;
    data['isLookUpFromAPI'] = this.isLookUpFromAPI;
    data['isDTHInfoCall'] = this.isDTHInfoCall;
    data['isShowPDFPlan'] = this.isShowPDFPlan;
    data['sid'] = this.sid;
    data['pCode'] = this.pCode;
    data['isOTPRequired'] = this.isOTPRequired;
    data['isBioMetricRequired'] = this.isBioMetricRequired;
    data['isDeviceRequired'] = this.isDeviceRequired;
    data['bioAuthType'] = this.bioAuthType;
    data['isRedirectToExternal'] = this.isRedirectToExternal;
    data['externalURL'] = this.externalURL;
    data['isResendAvailable'] = this.isResendAvailable;
    data['isDTHInfo'] = this.isDTHInfo;
    data['isRoffer'] = this.isRoffer;
    data['isGreen'] = this.isGreen;
    data['rid'] = this.rid;
    data['isHideService'] = this.isHideService;
    data['isBulkQRGeneration'] = this.isBulkQRGeneration;
    data['isSattlemntAccountVerify'] = this.isSattlemntAccountVerify;
    data['isEKYCForced'] = this.isEKYCForced;
    data['isDrawOpImage'] = this.isDrawOpImage;
    data['isAutoVerifyVPA'] = this.isAutoVerifyVPA;
    data['isCoin'] = this.isCoin;
    data['isB2cMembershipRePurchase'] = this.isB2cMembershipRePurchase;
    data['newsContent'] = this.newsContent;
    return data;
  }
}
