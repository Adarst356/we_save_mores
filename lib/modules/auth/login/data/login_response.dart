class LoginResponse {
  LoginResponse({
      this.isReferral, 
      this.userData, 
      this.isHeavyRefresh, 
      this.isTargetShow, 
      this.isRealAPIPerTransaction, 
      this.isAdminFlatComm, 
      this.activeFlatType, 
      this.isDenominationIncentive, 
      this.isAutoBilling, 
      this.withCustomLoginID, 
      this.isVirtualAccountInternal, 
      this.isAccountStatement, 
      this.isAreaMaster, 
      this.isPlanServiceUpdated, 
      this.isMultiLevel, 
      this.isPrepaidInfo, 
      this.isShowUPI, 
      this.canRedeemCommission, 
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

  LoginResponse.fromJson(dynamic json) {
    isReferral = json['isReferral'];
    userData = json['data'] != null ? UserData.fromJson(json['data']) : null;
    isHeavyRefresh = json['isHeavyRefresh'];
    isTargetShow = json['isTargetShow'];
    isRealAPIPerTransaction = json['isRealAPIPerTransaction'];
    isAdminFlatComm = json['isAdminFlatComm'];
    activeFlatType = json['activeFlatType'];
    isDenominationIncentive = json['isDenominationIncentive'];
    isAutoBilling = json['isAutoBilling'];
    withCustomLoginID = json['withCustomLoginID'];
    isVirtualAccountInternal = json['isVirtualAccountInternal'];
    isAccountStatement = json['isAccountStatement'];
    isAreaMaster = json['isAreaMaster'];
    isPlanServiceUpdated = json['isPlanServiceUpdated'];
    isMultiLevel = json['isMultiLevel'];
    isPrepaidInfo = json['isPrepaidInfo'];
    isShowUPI = json['isShowUPI'];
    canRedeemCommission = json['canRedeemCommission'];
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
  bool? isReferral;
  UserData? userData;
  bool? isHeavyRefresh;
  bool? isTargetShow;
  bool? isRealAPIPerTransaction;
  bool? isAdminFlatComm;
  num? activeFlatType;
  bool? isDenominationIncentive;
  bool? isAutoBilling;
  bool? withCustomLoginID;
  bool? isVirtualAccountInternal;
  bool? isAccountStatement;
  bool? isAreaMaster;
  bool? isPlanServiceUpdated;
  bool? isMultiLevel;
  bool? isPrepaidInfo;
  bool? isShowUPI;
  bool? canRedeemCommission;
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
LoginResponse copyWith({  bool? isReferral,
  UserData? userData,
  bool? isHeavyRefresh,
  bool? isTargetShow,
  bool? isRealAPIPerTransaction,
  bool? isAdminFlatComm,
  num? activeFlatType,
  bool? isDenominationIncentive,
  bool? isAutoBilling,
  bool? withCustomLoginID,
  bool? isVirtualAccountInternal,
  bool? isAccountStatement,
  bool? isAreaMaster,
  bool? isPlanServiceUpdated,
  bool? isMultiLevel,
  bool? isPrepaidInfo,
  bool? isShowUPI,
  bool? canRedeemCommission,
  num? statuscode,
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
}) => LoginResponse(  isReferral: isReferral ?? this.isReferral,
  userData: userData ?? this.userData,
  isHeavyRefresh: isHeavyRefresh ?? this.isHeavyRefresh,
  isTargetShow: isTargetShow ?? this.isTargetShow,
  isRealAPIPerTransaction: isRealAPIPerTransaction ?? this.isRealAPIPerTransaction,
  isAdminFlatComm: isAdminFlatComm ?? this.isAdminFlatComm,
  activeFlatType: activeFlatType ?? this.activeFlatType,
  isDenominationIncentive: isDenominationIncentive ?? this.isDenominationIncentive,
  isAutoBilling: isAutoBilling ?? this.isAutoBilling,
  withCustomLoginID: withCustomLoginID ?? this.withCustomLoginID,
  isVirtualAccountInternal: isVirtualAccountInternal ?? this.isVirtualAccountInternal,
  isAccountStatement: isAccountStatement ?? this.isAccountStatement,
  isAreaMaster: isAreaMaster ?? this.isAreaMaster,
  isPlanServiceUpdated: isPlanServiceUpdated ?? this.isPlanServiceUpdated,
  isMultiLevel: isMultiLevel ?? this.isMultiLevel,
  isPrepaidInfo: isPrepaidInfo ?? this.isPrepaidInfo,
  isShowUPI: isShowUPI ?? this.isShowUPI,
  canRedeemCommission: canRedeemCommission ?? this.canRedeemCommission,
  statuscode: statuscode ?? this.statuscode,
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
    map['isReferral'] = isReferral;
    if (userData != null) {
      map['data'] = userData?.toJson();
    }
    map['isHeavyRefresh'] = isHeavyRefresh;
    map['isTargetShow'] = isTargetShow;
    map['isRealAPIPerTransaction'] = isRealAPIPerTransaction;
    map['isAdminFlatComm'] = isAdminFlatComm;
    map['activeFlatType'] = activeFlatType;
    map['isDenominationIncentive'] = isDenominationIncentive;
    map['isAutoBilling'] = isAutoBilling;
    map['withCustomLoginID'] = withCustomLoginID;
    map['isVirtualAccountInternal'] = isVirtualAccountInternal;
    map['isAccountStatement'] = isAccountStatement;
    map['isAreaMaster'] = isAreaMaster;
    map['isPlanServiceUpdated'] = isPlanServiceUpdated;
    map['isMultiLevel'] = isMultiLevel;
    map['isPrepaidInfo'] = isPrepaidInfo;
    map['isShowUPI'] = isShowUPI;
    map['canRedeemCommission'] = canRedeemCommission;
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

class UserData {
  UserData({
      this.userID, 
      this.name, 
      this.mobileNo, 
      this.sessionID, 
      this.roleName, 
      this.roleID, 
      this.slabID, 
      this.loginTypeID, 
      this.emailID, 
      this.session, 
      this.outletID, 
      this.isDoubleFactor, 
      this.isPinRequired, 
      this.isRealAPI, 
      this.isDebitAllowed, 
      this.isMultiLevel, 
      this.isPGApprovalUserID, 
      this.stateID, 
      this.state, 
      this.pincode, 
      this.wid, 
      this.accountSecretKey,});

  UserData.fromJson(dynamic json) {
    userID = json['userID'];
    name = json['name'];
    mobileNo = json['mobileNo'];
    sessionID = json['sessionID'];
    roleName = json['roleName'];
    roleID = json['roleID'];
    slabID = json['slabID'];
    loginTypeID = json['loginTypeID'];
    emailID = json['emailID'];
    session = json['session'];
    outletID = json['outletID'];
    isDoubleFactor = json['isDoubleFactor'];
    isPinRequired = json['isPinRequired'];
    isRealAPI = json['isRealAPI'];
    isDebitAllowed = json['isDebitAllowed'];
    isMultiLevel = json['isMultiLevel'];
    isPGApprovalUserID = json['isPGApprovalUserID'];
    stateID = json['stateID'];
    state = json['state'];
    pincode = json['pincode'];
    wid = json['wid'];
    accountSecretKey = json['accountSecretKey'];
  }
  num? userID;
  String? name;
  String? mobileNo;
  num? sessionID;
  String? roleName;
  num? roleID;
  num? slabID;
  num? loginTypeID;
  String? emailID;
  String? session;
  num? outletID;
  bool? isDoubleFactor;
  bool? isPinRequired;
  bool? isRealAPI;
  bool? isDebitAllowed;
  bool? isMultiLevel;
  bool? isPGApprovalUserID;
  num? stateID;
  dynamic state;
  dynamic pincode;
  num? wid;
  dynamic accountSecretKey;
UserData copyWith({  num? userID,
  String? name,
  String? mobileNo,
  num? sessionID,
  String? roleName,
  num? roleID,
  num? slabID,
  num? loginTypeID,
  String? emailID,
  String? session,
  num? outletID,
  bool? isDoubleFactor,
  bool? isPinRequired,
  bool? isRealAPI,
  bool? isDebitAllowed,
  bool? isMultiLevel,
  bool? isPGApprovalUserID,
  num? stateID,
  dynamic state,
  dynamic pincode,
  num? wid,
  dynamic accountSecretKey,
}) => UserData(  userID: userID ?? this.userID,
  name: name ?? this.name,
  mobileNo: mobileNo ?? this.mobileNo,
  sessionID: sessionID ?? this.sessionID,
  roleName: roleName ?? this.roleName,
  roleID: roleID ?? this.roleID,
  slabID: slabID ?? this.slabID,
  loginTypeID: loginTypeID ?? this.loginTypeID,
  emailID: emailID ?? this.emailID,
  session: session ?? this.session,
  outletID: outletID ?? this.outletID,
  isDoubleFactor: isDoubleFactor ?? this.isDoubleFactor,
  isPinRequired: isPinRequired ?? this.isPinRequired,
  isRealAPI: isRealAPI ?? this.isRealAPI,
  isDebitAllowed: isDebitAllowed ?? this.isDebitAllowed,
  isMultiLevel: isMultiLevel ?? this.isMultiLevel,
  isPGApprovalUserID: isPGApprovalUserID ?? this.isPGApprovalUserID,
  stateID: stateID ?? this.stateID,
  state: state ?? this.state,
  pincode: pincode ?? this.pincode,
  wid: wid ?? this.wid,
  accountSecretKey: accountSecretKey ?? this.accountSecretKey,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userID'] = userID;
    map['name'] = name;
    map['mobileNo'] = mobileNo;
    map['sessionID'] = sessionID;
    map['roleName'] = roleName;
    map['roleID'] = roleID;
    map['slabID'] = slabID;
    map['loginTypeID'] = loginTypeID;
    map['emailID'] = emailID;
    map['session'] = session;
    map['outletID'] = outletID;
    map['isDoubleFactor'] = isDoubleFactor;
    map['isPinRequired'] = isPinRequired;
    map['isRealAPI'] = isRealAPI;
    map['isDebitAllowed'] = isDebitAllowed;
    map['isMultiLevel'] = isMultiLevel;
    map['isPGApprovalUserID'] = isPGApprovalUserID;
    map['stateID'] = stateID;
    map['state'] = state;
    map['pincode'] = pincode;
    map['wid'] = wid;
    map['accountSecretKey'] = accountSecretKey;
    return map;
  }

}