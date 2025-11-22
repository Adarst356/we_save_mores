class TransactionResponse {
  dynamic refferalContent;
  dynamic refferalImage;
  List<RechargeReport>? rechargeReport;
  dynamic dthSubscriptions;
  dynamic dmtReport;
  dynamic ledgerReport;
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

  TransactionResponse();

  TransactionResponse.fromJson(Map<String, dynamic> json) {
    refferalContent = json['refferalContent'];
    refferalImage = json['refferalImage'];

    if (json['rechargeReport'] != null) {
      rechargeReport = [];
      json['rechargeReport'].forEach((v) {
        rechargeReport!.add(RechargeReport.fromJson(v));
      });
    }

    dthSubscriptions = json['dthSubscriptions'];
    dmtReport = json['dmtReport'];
    ledgerReport = json['ledgerReport'];
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
}

class RechargeReport {
  int? iServiceID;
  int? tid;
  String? transactionID;
  String? prefix;
  int? userID;
  String? role;
  String? outletNo;
  String? outlet;
  String? account;
  int? oid;
  String? operator;
  double? lastBalance;
  int? requestedAmount;
  double? amount;
  int? balance;
  String? slabCommType;
  double? commission;
  String? entryDate;
  String? api;
  String? liveID;
  int? iType;
  String? type;
  String? vendorID;
  String? apiRequestID;
  String? modifyDate;

  String? optional1;
  String? optional2;
  String? optional3;
  String? optional4;

  String? display1;
  String? display2;
  String? display3;
  String? display4;

  String? switchingName;
  int? switchingID;
  String? circleName;

  int? refundStatus;   /// FIXED
  String? refundStatusText; /// FIXED

  bool? isWTR;
  bool? commType;
  int? gstAmount;
  int? tdsAmount;

  String? customerNo;
  String? ccName;
  String? ccMobile;

  String? apiCode;
  String? extraParam;

  String? requestMode;
  String? requestIP;

  String? o8;
  String? o9;
  String? o10;
  String? o11;
  String? o15;

  int? requestModeID;
  int? groupID;

  String? rOfferAmount;
  String? beniName;

  RechargeReport();

  RechargeReport.fromJson(Map<String, dynamic> json) {
    iServiceID = json['_ServiceID'];
    tid = json['tid'];
    transactionID = json['transactionID'];
    prefix = json['prefix'];
    userID = json['userID'];
    role = json['role'];
    outletNo = json['outletNo'];
    outlet = json['outlet'];
    account = json['account'];
    oid = json['oid'];
    operator = json['operator'];
    lastBalance = (json['lastBalance'] ?? 0).toDouble();
    requestedAmount = json['requestedAmount'];
    amount = (json['amount'] ?? 0).toDouble();
    balance = json['balance'];
    slabCommType = json['slabCommType'];
    commission = (json['commission'] ?? 0).toDouble();
    entryDate = json['entryDate'];
    api = json['api'];
    liveID = json['liveID'];
    iType = json['_Type'];
    type = json['type_'];
    vendorID = json['vendorID'];
    apiRequestID = json['apiRequestID'];
    modifyDate = json['modifyDate'];

    optional1 = json['optional1'];
    optional2 = json['optional2'];
    optional3 = json['optional3'];
    optional4 = json['optional4'];

    display1 = json['display1'];
    display2 = json['display2'];
    display3 = json['display3'];
    display4 = json['display4'];

    switchingName = json['switchingName'];
    switchingID = json['switchingID'];
    circleName = json['circleName'];

    refundStatus = json['refundStatus'];
    refundStatusText = json['refundStatus_']; /// FIXED

    isWTR = json['isWTR'];
    commType = json['commType'];
    gstAmount = json['gstAmount'];
    tdsAmount = json['tdsAmount'];

    customerNo = json['customerNo'];
    ccName = json['ccName'];
    ccMobile = json['ccMobile'];

    apiCode = json['apiCode'];
    extraParam = json['extraParam'];
    requestMode = json['requestMode'];
    requestIP = json['requestIP'];

    o8 = json['o8'];
    o9 = json['o9'];
    o10 = json['o10'];
    o11 = json['o11'];
    o15 = json['o15'];

    requestModeID = json['requestModeID'];
    groupID = json['groupID'];

    rOfferAmount = json['rOfferAmount'];
    beniName = json['beniName'];
  }
}
