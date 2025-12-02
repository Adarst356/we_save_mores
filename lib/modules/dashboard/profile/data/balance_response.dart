class BalanceResponse {
  bool? isReferral;
  Data? data;
  bool? isFlatCommission;
  int? activeFlatType;
  bool? isWalletToWallet;
  bool? isRealSettlement;
  bool? isROI;
  int? statuscode;
  String? msg;
  bool? isVersionValid;
  bool? isAppValid;
  int? checkID;
  bool? isPasswordExpired;
  dynamic? mobileNo;
  dynamic? emailID;
  dynamic? outletName;
  bool? isLookUpFromAPI;
  bool? isDTHInfoCall;
  bool? isShowPDFPlan;
  dynamic? sid;
  dynamic? pCode;
  bool? isOTPRequired;
  bool? isBioMetricRequired;
  bool? isDeviceRequired;
  int? bioAuthType;
  bool? isRedirectToExternal;
  dynamic? externalURL;
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
  dynamic? newsContent;

  BalanceResponse({
    this.isReferral,
    this.data,
    this.isFlatCommission,
    this.activeFlatType,
    this.isWalletToWallet,
    this.isRealSettlement,
    this.isROI,
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

  BalanceResponse.fromJson(Map<String, dynamic> json) {
    isReferral = json['isReferral'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    isFlatCommission = json['isFlatCommission'];
    activeFlatType = json['activeFlatType'];
    isWalletToWallet = json['isWalletToWallet'];
    isRealSettlement = json['isRealSettlement'];
    isROI = json['isROI'];
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
    data['isReferral'] = this.isReferral;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['isFlatCommission'] = this.isFlatCommission;
    data['activeFlatType'] = this.activeFlatType;
    data['isWalletToWallet'] = this.isWalletToWallet;
    data['isRealSettlement'] = this.isRealSettlement;
    data['isROI'] = this.isROI;
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

class Data {
  bool? isShowLBA;
  double? balance;       // int? se double? kar diya
  double? bCapping;      // int? se double?
  bool? isBalance;
  bool? isBalanceFund;
  double? uBalance;      // int? se double?
  double? uCapping;      // int? se double?
  bool? isUBalance;
  bool? isUBalanceFund;
  double? bBalance;
  double? bbCapping;
  bool? isBBalance;
  bool? isBBalanceFund;
  double? cBalance;
  double? cCapping;
  bool? isCBalance;
  bool? isCBalanceFund;
  double? idBalnace;
  double? osBalance;
  double? idCapping;
  bool? isIDBalance;
  bool? isIDBalanceFund;
  double? pacakgeBalance;
  double? packageCapping;
  bool? isPacakgeBalance;
  bool? isPacakgeBalanceFund;
  bool? isP;
  bool? isPN;
  bool? isLowBalance;
  bool? isFlatCommissionU;
  bool? isPackageDeducionForRetailor;
  bool? isAdminDefined;
  double? commRate;
  String? vian;
  bool? invoiceByAdmin;
  bool? isMarkedGreen;
  bool? isQRMappedToUser;
  bool? isCandebit;
  String? prepaidWalletName;
  String? utilityWalletName;
  String? bankWalletName;
  String? cardWalletName;
  String? regIDWalletName;
  String? packageWalletName;
  bool? isShowSocialPopup;
  int? walletTypeId;

  Data({
    this.isShowLBA,
    this.balance,
    this.bCapping,
    this.isBalance,
    this.isBalanceFund,
    this.uBalance,
    this.uCapping,
    this.isUBalance,
    this.isUBalanceFund,
    this.bBalance,
    this.bbCapping,
    this.isBBalance,
    this.isBBalanceFund,
    this.cBalance,
    this.cCapping,
    this.isCBalance,
    this.isCBalanceFund,
    this.idBalnace,
    this.osBalance,
    this.idCapping,
    this.isIDBalance,
    this.isIDBalanceFund,
    this.pacakgeBalance,
    this.packageCapping,
    this.isPacakgeBalance,
    this.isPacakgeBalanceFund,
    this.isP,
    this.isPN,
    this.isLowBalance,
    this.isFlatCommissionU,
    this.isPackageDeducionForRetailor,
    this.isAdminDefined,
    this.commRate,
    this.vian,
    this.invoiceByAdmin,
    this.isMarkedGreen,
    this.isQRMappedToUser,
    this.isCandebit,
    this.prepaidWalletName,
    this.utilityWalletName,
    this.bankWalletName,
    this.cardWalletName,
    this.regIDWalletName,
    this.packageWalletName,
    this.isShowSocialPopup,
    this.walletTypeId,
  });

  Data.fromJson(Map<String, dynamic> json) {
    isShowLBA = json['isShowLBA'];
    balance = (json['balance'] as num?)?.toDouble(); // double? conversion
    bCapping = (json['bCapping'] as num?)?.toDouble();
    isBalance = json['isBalance'];
    isBalanceFund = json['isBalanceFund'];
    uBalance = (json['uBalance'] as num?)?.toDouble();
    uCapping = (json['uCapping'] as num?)?.toDouble();
    isUBalance = json['isUBalance'];
    isUBalanceFund = json['isUBalanceFund'];
    bBalance = (json['bBalance'] as num?)?.toDouble();
    bbCapping = (json['bbCapping'] as num?)?.toDouble();
    isBBalance = json['isBBalance'];
    isBBalanceFund = json['isBBalanceFund'];
    cBalance = (json['cBalance'] as num?)?.toDouble();
    cCapping = (json['cCapping'] as num?)?.toDouble();
    idBalnace = (json['idBalnace'] as num?)?.toDouble();
    osBalance = (json['osBalance'] as num?)?.toDouble();
    idCapping = (json['idCapping'] as num?)?.toDouble();
    isIDBalance = json['isIDBalance'];
    isIDBalanceFund = json['isIDBalanceFund'];
    pacakgeBalance = (json['pacakgeBalance'] as num?)?.toDouble();
    packageCapping = (json['packageCapping'] as num?)?.toDouble();
    isPacakgeBalance = json['isPacakgeBalance'];
    isPacakgeBalanceFund = json['isPacakgeBalanceFund'];
    isP = json['isP'];
    isPN = json['isPN'];
    isLowBalance = json['isLowBalance'];
    isFlatCommissionU = json['isFlatCommissionU'];
    isPackageDeducionForRetailor = json['isPackageDeducionForRetailor'];
    isAdminDefined = json['isAdminDefined'];
    commRate = (json['commRate'] as num?)?.toDouble();
    vian = json['vian'];
    invoiceByAdmin = json['invoiceByAdmin'];
    isMarkedGreen = json['isMarkedGreen'];
    isQRMappedToUser = json['isQRMappedToUser'];
    isCandebit = json['isCandebit'];
    prepaidWalletName = json['prepaidWalletName'];
    utilityWalletName = json['utilityWalletName'];
    bankWalletName = json['bankWalletName'];
    cardWalletName = json['cardWalletName'];
    regIDWalletName = json['regIDWalletName'];
    packageWalletName = json['packageWalletName'];
    isShowSocialPopup = json['isShowSocialPopup'];
    walletTypeId = json['walletTypeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['balance'] = balance;
    data['bCapping'] = bCapping;
    data['uBalance'] = uBalance;
    data['uCapping'] = uCapping;
    data['bBalance'] = bBalance;
    data['bbCapping'] = bbCapping;
    data['cBalance'] = cBalance;
    data['cCapping'] = cCapping;
    data['idBalnace'] = idBalnace;
    data['osBalance'] = osBalance;
    data['idCapping'] = idCapping;
    data['pacakgeBalance'] = pacakgeBalance;
    data['packageCapping'] = packageCapping;
    data['commRate'] = commRate;
    return data;
  }
}

