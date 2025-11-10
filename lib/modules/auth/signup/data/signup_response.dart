class SignupResponse {
  SignupResponse({
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
      this.newsContent,});

  SignupResponse.fromJson(dynamic json) {
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
  num? statuscode;
  String? msg;
  bool? isVersionValid;
  bool? isAppValid;
  num? checkID;
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
  num? bioAuthType;
  bool? isRedirectToExternal;
  dynamic externalURL;
  bool? isResendAvailable;
  bool? isDTHInfo;
  bool? isRoffer;
  bool? isGreen;
  num? rid;
  bool? isHideService;
  bool? isBulkQRGeneration;
  bool? isSattlemntAccountVerify;
  bool? isEKYCForced;
  bool? isDrawOpImage;
  bool? isAutoVerifyVPA;
  bool? isCoin;
  bool? isB2cMembershipRePurchase;
  dynamic newsContent;
SignupResponse copyWith({  num? statuscode,
  String? msg,
  bool? isVersionValid,
  bool? isAppValid,
  num? checkID,
  bool? isPasswordExpired,
  dynamic mobileNo,
  dynamic emailID,
  dynamic outletName,
  bool? isLookUpFromAPI,
  bool? isDTHInfoCall,
  bool? isShowPDFPlan,
  dynamic sid,
  dynamic pCode,
  bool? isOTPRequired,
  bool? isBioMetricRequired,
  bool? isDeviceRequired,
  num? bioAuthType,
  bool? isRedirectToExternal,
  dynamic externalURL,
  bool? isResendAvailable,
  bool? isDTHInfo,
  bool? isRoffer,
  bool? isGreen,
  num? rid,
  bool? isHideService,
  bool? isBulkQRGeneration,
  bool? isSattlemntAccountVerify,
  bool? isEKYCForced,
  bool? isDrawOpImage,
  bool? isAutoVerifyVPA,
  bool? isCoin,
  bool? isB2cMembershipRePurchase,
  dynamic newsContent,
}) => SignupResponse(  statuscode: statuscode ?? this.statuscode,
  msg: msg ?? this.msg,
  isVersionValid: isVersionValid ?? this.isVersionValid,
  isAppValid: isAppValid ?? this.isAppValid,
  checkID: checkID ?? this.checkID,
  isPasswordExpired: isPasswordExpired ?? this.isPasswordExpired,
  mobileNo: mobileNo ?? this.mobileNo,
  emailID: emailID ?? this.emailID,
  outletName: outletName ?? this.outletName,
  isLookUpFromAPI: isLookUpFromAPI ?? this.isLookUpFromAPI,
  isDTHInfoCall: isDTHInfoCall ?? this.isDTHInfoCall,
  isShowPDFPlan: isShowPDFPlan ?? this.isShowPDFPlan,
  sid: sid ?? this.sid,
  pCode: pCode ?? this.pCode,
  isOTPRequired: isOTPRequired ?? this.isOTPRequired,
  isBioMetricRequired: isBioMetricRequired ?? this.isBioMetricRequired,
  isDeviceRequired: isDeviceRequired ?? this.isDeviceRequired,
  bioAuthType: bioAuthType ?? this.bioAuthType,
  isRedirectToExternal: isRedirectToExternal ?? this.isRedirectToExternal,
  externalURL: externalURL ?? this.externalURL,
  isResendAvailable: isResendAvailable ?? this.isResendAvailable,
  isDTHInfo: isDTHInfo ?? this.isDTHInfo,
  isRoffer: isRoffer ?? this.isRoffer,
  isGreen: isGreen ?? this.isGreen,
  rid: rid ?? this.rid,
  isHideService: isHideService ?? this.isHideService,
  isBulkQRGeneration: isBulkQRGeneration ?? this.isBulkQRGeneration,
  isSattlemntAccountVerify: isSattlemntAccountVerify ?? this.isSattlemntAccountVerify,
  isEKYCForced: isEKYCForced ?? this.isEKYCForced,
  isDrawOpImage: isDrawOpImage ?? this.isDrawOpImage,
  isAutoVerifyVPA: isAutoVerifyVPA ?? this.isAutoVerifyVPA,
  isCoin: isCoin ?? this.isCoin,
  isB2cMembershipRePurchase: isB2cMembershipRePurchase ?? this.isB2cMembershipRePurchase,
  newsContent: newsContent ?? this.newsContent,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statuscode'] = statuscode;
    map['msg'] = msg;
    map['isVersionValid'] = isVersionValid;
    map['isAppValid'] = isAppValid;
    map['checkID'] = checkID;
    map['isPasswordExpired'] = isPasswordExpired;
    map['mobileNo'] = mobileNo;
    map['emailID'] = emailID;
    map['outletName'] = outletName;
    map['isLookUpFromAPI'] = isLookUpFromAPI;
    map['isDTHInfoCall'] = isDTHInfoCall;
    map['isShowPDFPlan'] = isShowPDFPlan;
    map['sid'] = sid;
    map['pCode'] = pCode;
    map['isOTPRequired'] = isOTPRequired;
    map['isBioMetricRequired'] = isBioMetricRequired;
    map['isDeviceRequired'] = isDeviceRequired;
    map['bioAuthType'] = bioAuthType;
    map['isRedirectToExternal'] = isRedirectToExternal;
    map['externalURL'] = externalURL;
    map['isResendAvailable'] = isResendAvailable;
    map['isDTHInfo'] = isDTHInfo;
    map['isRoffer'] = isRoffer;
    map['isGreen'] = isGreen;
    map['rid'] = rid;
    map['isHideService'] = isHideService;
    map['isBulkQRGeneration'] = isBulkQRGeneration;
    map['isSattlemntAccountVerify'] = isSattlemntAccountVerify;
    map['isEKYCForced'] = isEKYCForced;
    map['isDrawOpImage'] = isDrawOpImage;
    map['isAutoVerifyVPA'] = isAutoVerifyVPA;
    map['isCoin'] = isCoin;
    map['isB2cMembershipRePurchase'] = isB2cMembershipRePurchase;
    map['newsContent'] = newsContent;
    return map;
  }

}