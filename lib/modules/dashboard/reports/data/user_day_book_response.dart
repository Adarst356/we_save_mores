class UserDayBookResponse {
  dynamic refferalContent;
  dynamic refferalImage;
  dynamic rechargeReport;
  dynamic dthSubscriptions;
  dynamic dmtReport;
  dynamic ledgerReport;
  List<dynamic>? userDaybookReport;
  dynamic userDaybookDMRReport;
  dynamic fundDCReport;
  dynamic fundOrderReport;
  dynamic slabCommissions;
  dynamic slabDetailDisplayLvl;
  dynamic userListRoleWise;
  dynamic childRoles;
  dynamic fundRequestForApproval;
  dynamic banners;
  dynamic appLogoUrl;
  dynamic notifications;
  dynamic refundLog;
  dynamic companyProfile;
  dynamic targetAchieveds;
  dynamic aePsDetail;
  dynamic incentiveDetails;
  dynamic moveToWalletReport;
  dynamic fosList;
  dynamic videoList;
  dynamic ascReport;
  dynamic receiptDetail;
  dynamic accountOpeningDeatils;
  dynamic targetIncomes;
  dynamic accountStatementSummary;
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

  UserDayBookResponse({
    this.refferalContent,
    this.refferalImage,
    this.rechargeReport,
    this.dthSubscriptions,
    this.dmtReport,
    this.ledgerReport,
    this.userDaybookReport,
    this.userDaybookDMRReport,
    this.fundDCReport,
    this.fundOrderReport,
    this.slabCommissions,
    this.slabDetailDisplayLvl,
    this.userListRoleWise,
    this.childRoles,
    this.fundRequestForApproval,
    this.banners,
    this.appLogoUrl,
    this.notifications,
    this.refundLog,
    this.companyProfile,
    this.targetAchieveds,
    this.aePsDetail,
    this.incentiveDetails,
    this.moveToWalletReport,
    this.fosList,
    this.videoList,
    this.ascReport,
    this.receiptDetail,
    this.accountOpeningDeatils,
    this.targetIncomes,
    this.accountStatementSummary,
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

  UserDayBookResponse.fromJson(Map<String, dynamic> json) {
    refferalContent = json['refferalContent'];
    refferalImage = json['refferalImage'];
    rechargeReport = json['rechargeReport'];
    dthSubscriptions = json['dthSubscriptions'];
    dmtReport = json['dmtReport'];
    ledgerReport = json['ledgerReport'];
    userDaybookReport = json['userDaybookReport'] != null
        ? List<dynamic>.from(json['userDaybookReport'])
        : null;
    userDaybookDMRReport = json['userDaybookDMRReport'];
    fundDCReport = json['fundDCReport'];
    fundOrderReport = json['fundOrderReport'];
    slabCommissions = json['slabCommissions'];
    slabDetailDisplayLvl = json['slabDetailDisplayLvl'];
    userListRoleWise = json['userListRoleWise'];
    childRoles = json['childRoles'];
    fundRequestForApproval = json['fundRequestForApproval'];
    banners = json['banners'];
    appLogoUrl = json['appLogoUrl'];
    notifications = json['notifications'];
    refundLog = json['refundLog'];
    companyProfile = json['companyProfile'];
    targetAchieveds = json['targetAchieveds'];
    aePsDetail = json['aePsDetail'];
    incentiveDetails = json['incentiveDetails'];
    moveToWalletReport = json['moveToWalletReport'];
    fosList = json['fosList'];
    videoList = json['videoList'];
    ascReport = json['ascReport'];
    receiptDetail = json['receiptDetail'];
    accountOpeningDeatils = json['accountOpeningDeatils'];
    targetIncomes = json['targetIncomes'];
    accountStatementSummary = json['accountStatementSummary'];
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
    final data = <String, dynamic>{};
    data['refferalContent'] = refferalContent;
    data['refferalImage'] = refferalImage;
    data['rechargeReport'] = rechargeReport;
    data['dthSubscriptions'] = dthSubscriptions;
    data['dmtReport'] = dmtReport;
    data['ledgerReport'] = ledgerReport;
    data['userDaybookReport'] = userDaybookReport;
    data['userDaybookDMRReport'] = userDaybookDMRReport;
    data['fundDCReport'] = fundDCReport;
    data['fundOrderReport'] = fundOrderReport;
    data['slabCommissions'] = slabCommissions;
    data['slabDetailDisplayLvl'] = slabDetailDisplayLvl;
    data['userListRoleWise'] = userListRoleWise;
    data['childRoles'] = childRoles;
    data['fundRequestForApproval'] = fundRequestForApproval;
    data['banners'] = banners;
    data['appLogoUrl'] = appLogoUrl;
    data['notifications'] = notifications;
    data['refundLog'] = refundLog;
    data['companyProfile'] = companyProfile;
    data['targetAchieveds'] = targetAchieveds;
    data['aePsDetail'] = aePsDetail;
    data['incentiveDetails'] = incentiveDetails;
    data['moveToWalletReport'] = moveToWalletReport;
    data['fosList'] = fosList;
    data['videoList'] = videoList;
    data['ascReport'] = ascReport;
    data['receiptDetail'] = receiptDetail;
    data['accountOpeningDeatils'] = accountOpeningDeatils;
    data['targetIncomes'] = targetIncomes;
    data['accountStatementSummary'] = accountStatementSummary;
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
