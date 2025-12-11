class LedgerReportResponse {
  dynamic refferalContent;
  dynamic refferalImage;
  dynamic rechargeReport;
  dynamic dthSubscriptions;
  dynamic dmtReport;
  List<dynamic>? ledgerReport;
  dynamic userDaybookReport;
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

  LedgerReportResponse({
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

  LedgerReportResponse.fromJson(Map<String, dynamic> json) {
    refferalContent = json['refferalContent'];
    refferalImage = json['refferalImage'];
    rechargeReport = json['rechargeReport'];
    dthSubscriptions = json['dthSubscriptions'];
    dmtReport = json['dmtReport'];

    ledgerReport = json['ledgerReport']?.cast<dynamic>();

    userDaybookReport = json['userDaybookReport'];
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
    return {
      'refferalContent': refferalContent,
      'refferalImage': refferalImage,
      'rechargeReport': rechargeReport,
      'dthSubscriptions': dthSubscriptions,
      'dmtReport': dmtReport,
      'ledgerReport': ledgerReport,
      'userDaybookReport': userDaybookReport,
      'userDaybookDMRReport': userDaybookDMRReport,
      'fundDCReport': fundDCReport,
      'fundOrderReport': fundOrderReport,
      'slabCommissions': slabCommissions,
      'slabDetailDisplayLvl': slabDetailDisplayLvl,
      'userListRoleWise': userListRoleWise,
      'childRoles': childRoles,
      'fundRequestForApproval': fundRequestForApproval,
      'banners': banners,
      'appLogoUrl': appLogoUrl,
      'notifications': notifications,
      'refundLog': refundLog,
      'companyProfile': companyProfile,
      'targetAchieveds': targetAchieveds,
      'aePsDetail': aePsDetail,
      'incentiveDetails': incentiveDetails,
      'moveToWalletReport': moveToWalletReport,
      'fosList': fosList,
      'videoList': videoList,
      'ascReport': ascReport,
      'receiptDetail': receiptDetail,
      'accountOpeningDeatils': accountOpeningDeatils,
      'targetIncomes': targetIncomes,
      'accountStatementSummary': accountStatementSummary,
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
