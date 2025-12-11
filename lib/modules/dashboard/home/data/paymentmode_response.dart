class PaymentModeResponse {
  bool? isHeavyRefresh;
  bool? isTakeCustomerNo;
  Data? data;
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

  PaymentModeResponse({
    this.isHeavyRefresh,
    this.isTakeCustomerNo,
    this.data,
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

  PaymentModeResponse.fromJson(Map<String, dynamic> json) {
    isHeavyRefresh = json['isHeavyRefresh'];
    isTakeCustomerNo = json['isTakeCustomerNo'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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
    data['isHeavyRefresh'] = this.isHeavyRefresh;
    data['isTakeCustomerNo'] = this.isTakeCustomerNo;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
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

// ------------------------------

class Data {
  dynamic numSeries;
  List<Operators>? operators;
  dynamic cirlces;

  Data({this.numSeries, this.operators, this.cirlces});

  Data.fromJson(Map<String, dynamic> json) {
    numSeries = json['numSeries'];
    if (json['operators'] != null) {
      operators = <Operators>[];
      json['operators'].forEach((v) {
        operators!.add(Operators.fromJson(v));
      });
    }
    cirlces = json['cirlces'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['numSeries'] = numSeries;
    if (operators != null) {
      data['operators'] = operators!.map((v) => v.toJson()).toList();
    }
    data['cirlces'] = cirlces;
    return data;
  }
}

// ------------------------------

class Operators {
  num? type;
  String? name;
  num? oid;
  dynamic opid;
  dynamic billerID;
  dynamic operator;
  dynamic tollFree;
  num? opType;
  num? exactNessID;
  dynamic exactNess;
  dynamic redirectURL;
  bool? isBBPS;
  bool? isBilling;
  bool? inSlab;
  bool? isTakeCustomerNum;
  String? spKey;
  num? min;
  num? max;
  num? length;
  num? lengthMax;
  dynamic startWith;
  dynamic image;
  bool? isPartial;
  dynamic accountName;
  dynamic accountRemak;
  bool? isAccountNumeric;
  bool? isGroupLeader;
  num? commSettingType;
  num? minRange;
  num? maxRange;
  num? rangeId;
  dynamic chargeAmtType;
  bool? isPaidAdditional;
  bool? isAdditionalServiceType;
  num? stateID;
  num? ind;
  dynamic accountNoKey;
  dynamic regExAccount;
  dynamic customerNoKey;
  dynamic planDocName;
  bool? isAmountValidation;
  num? allowedChannel;
  num? planOID;
  num? rofferOID;
  num? dthCustInfoOID;
  num? dthhrefoid;
  num? rechOID;
  dynamic allowChannel;
  bool? isSpecialOp;
  bool? isUtilityOpreator;
  dynamic opTypeName;
  num? inMultipleOf;
  num? charge;
  num? serviceID;
  dynamic serviceName;
  num? packageId;
  bool? isActive;
  bool? isServiceActive;
  bool? isVisible;
  dynamic sCode;
  num? walletTypeID;
  bool? selfAssigned;

  Operators.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    oid = json['oid'];
    opid = json['opid'];
    billerID = json['billerID'];
    operator = json['operator'];
    tollFree = json['tollFree'];
    opType = json['opType'];
    exactNessID = json['exactNessID'];
    exactNess = json['exactNess'];
    redirectURL = json['redirectURL'];
    isBBPS = json['isBBPS'];
    isBilling = json['isBilling'];
    inSlab = json['inSlab'];
    isTakeCustomerNum = json['isTakeCustomerNum'];
    spKey = json['spKey'];
    min = json['min'];
    max = json['max'];
    length = json['length'];
    lengthMax = json['lengthMax'];
    startWith = json['startWith'];
    image = json['image'];
    isPartial = json['isPartial'];
    accountName = json['accountName'];
    accountRemak = json['accountRemak'];
    isAccountNumeric = json['isAccountNumeric'];
    isGroupLeader = json['isGroupLeader'];
    commSettingType = json['commSettingType'];
    minRange = json['minRange'];
    maxRange = json['maxRange'];
    rangeId = json['rangeId'];
    chargeAmtType = json['chargeAmtType'];
    isPaidAdditional = json['isPaidAdditional'];
    isAdditionalServiceType = json['isAdditionalServiceType'];
    stateID = json['stateID'];
    ind = json['ind'];
    accountNoKey = json['accountNoKey'];
    regExAccount = json['regExAccount'];
    customerNoKey = json['customerNoKey'];
    planDocName = json['planDocName'];
    isAmountValidation = json['isAmountValidation'];
    allowedChannel = json['allowedChannel'];
    planOID = json['planOID'];
    rofferOID = json['rofferOID'];
    dthCustInfoOID = json['dthCustInfoOID'];
    dthhrefoid = json['dthhrefoid'];
    rechOID = json['rechOID'];
    allowChannel = json['allowChannel'];
    isSpecialOp = json['isSpecialOp'];
    isUtilityOpreator = json['isUtilityOpreator'];
    opTypeName = json['opTypeName'];
    inMultipleOf = json['inMultipleOf'];
    charge = json['charge'];
    serviceID = json['serviceID'];
    serviceName = json['serviceName'];
    packageId = json['packageId'];
    isActive = json['isActive'];
    isServiceActive = json['isServiceActive'];
    isVisible = json['isVisible'];
    sCode = json['sCode'];
    walletTypeID = json['walletTypeID'];
    selfAssigned = json['selfAssigned'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['name'] = name;
    data['oid'] = oid;
    data['opid'] = opid;
    data['billerID'] = billerID;
    data['operator'] = operator;
    data['tollFree'] = tollFree;
    data['opType'] = opType;
    data['exactNessID'] = exactNessID;
    data['exactNess'] = exactNess;
    data['redirectURL'] = redirectURL;
    data['isBBPS'] = isBBPS;
    data['isBilling'] = isBilling;
    data['inSlab'] = inSlab;
    data['isTakeCustomerNum'] = isTakeCustomerNum;
    data['spKey'] = spKey;
    data['min'] = min;
    data['max'] = max;
    data['length'] = length;
    data['lengthMax'] = lengthMax;
    data['startWith'] = startWith;
    data['image'] = image;
    data['isPartial'] = isPartial;
    data['accountName'] = accountName;
    data['accountRemak'] = accountRemak;
    data['isAccountNumeric'] = isAccountNumeric;
    data['isGroupLeader'] = isGroupLeader;
    data['commSettingType'] = commSettingType;
    data['minRange'] = minRange;
    data['maxRange'] = maxRange;
    data['rangeId'] = rangeId;
    data['chargeAmtType'] = chargeAmtType;
    data['isPaidAdditional'] = isPaidAdditional;
    data['isAdditionalServiceType'] = isAdditionalServiceType;
    data['stateID'] = stateID;
    data['ind'] = ind;
    data['accountNoKey'] = accountNoKey;
    data['regExAccount'] = regExAccount;
    data['customerNoKey'] = customerNoKey;
    data['planDocName'] = planDocName;
    data['isAmountValidation'] = isAmountValidation;
    data['allowedChannel'] = allowedChannel;
    data['planOID'] = planOID;
    data['rofferOID'] = rofferOID;
    data['dthCustInfoOID'] = dthCustInfoOID;
    data['dthhrefoid'] = dthhrefoid;
    data['rechOID'] = rechOID;
    data['allowChannel'] = allowChannel;
    data['isSpecialOp'] = isSpecialOp;
    data['isUtilityOpreator'] = isUtilityOpreator;
    data['opTypeName'] = opTypeName;
    data['inMultipleOf'] = inMultipleOf;
    data['charge'] = charge;
    data['serviceID'] = serviceID;
    data['serviceName'] = serviceName;
    data['packageId'] = packageId;
    data['isActive'] = isActive;
    data['isServiceActive'] = isServiceActive;
    data['isVisible'] = isVisible;
    data['sCode'] = sCode;
    data['walletTypeID'] = walletTypeID;
    data['selfAssigned'] = selfAssigned;
    return data;
  }
}
