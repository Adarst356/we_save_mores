class GetNumberList {
  bool? isHeavyRefresh;
  bool? isTakeCustomerNo;
  Data? data;
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

  GetNumberList({
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

  GetNumberList.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isHeavyRefresh'] = isHeavyRefresh;
    data['isTakeCustomerNo'] = isTakeCustomerNo;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
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

class Data {
  List<NumSeries>? numSeries;
  List<Operators>? operators;
  List<Cirlces>? cirlces;

  Data({this.numSeries, this.operators, this.cirlces});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['numSeries'] != null) {
      numSeries = <NumSeries>[];
      json['numSeries'].forEach((v) {
        numSeries!.add(NumSeries.fromJson(v));
      });
    }
    if (json['operators'] != null) {
      operators = <Operators>[];
      json['operators'].forEach((v) {
        operators!.add(Operators.fromJson(v));
      });
    }
    if (json['cirlces'] != null) {
      cirlces = <Cirlces>[];
      json['cirlces'].forEach((v) {
        cirlces!.add(Cirlces.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (numSeries != null) {
      data['numSeries'] = numSeries!.map((v) => v.toJson()).toList();
    }
    if (operators != null) {
      data['operators'] = operators!.map((v) => v.toJson()).toList();
    }
    if (cirlces != null) {
      data['cirlces'] = cirlces!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NumSeries {
  int? oid;
  int? series;
  int? circleCode;
  int? circleID;
  dynamic circle;
  dynamic number;

  NumSeries({
    this.oid,
    this.series,
    this.circleCode,
    this.circleID,
    this.circle,
    this.number,
  });

  NumSeries.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    series = json['series'];
    circleCode = json['circleCode'];
    circleID = json['circleID'];
    circle = json['circle'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['oid'] = oid;
    data['series'] = series;
    data['circleCode'] = circleCode;
    data['circleID'] = circleID;
    data['circle'] = circle;
    data['number'] = number;
    return data;
  }
}

class Operators {
  String? header;
  bool? isHeader;

  int? type;
  String? name;
  int? oid;
  String? opid;
  String? billerID;
  dynamic operator;
  String? tollFree;
  int? opType;
  int? exactNessID;
  String? exactNess;
  String? redirectURL;
  bool? isBBPS;
  bool? isBilling;
  bool? inSlab;
  bool? isTakeCustomerNum;
  dynamic spKey;
  int? min;
  int? max;
  int? length;
  int? lengthMax;
  String? startWith;
  String? image;
  bool? isPartial;
  String? accountName;
  String? accountRemak;
  bool? isAccountNumeric;
  bool? isGroupLeader;
  int? commSettingType;
  int? minRange;
  int? maxRange;
  int? rangeId;
  bool? chargeAmtType;
  bool? isPaidAdditional;
  bool? isAdditionalServiceType;
  int? stateID;
  int? ind;
  String? accountNoKey;
  String? regExAccount;
  String? customerNoKey;
  dynamic planDocName;
  bool? isAmountValidation;
  int? allowedChannel;
  int? planOID;
  int? rofferOID;
  int? dthCustInfoOID;
  int? dthhrefoid;
  int? rechOID;
  dynamic allowChannel;
  bool? isSpecialOp;
  bool? isUtilityOpreator;
  String? opTypeName;
  int? inMultipleOf;
  double? charge;
  int? serviceID;
  dynamic serviceName;
  int? packageId;
  bool? isActive;
  bool? isServiceActive;
  bool? isVisible;
  dynamic sCode;
  int? walletTypeID;
  bool? selfAssigned;

  Operators({
    this.type,
    this.name,
    this.oid,
    this.opid,
    this.billerID,
    this.operator,
    this.tollFree,
    this.opType,
    this.exactNessID,
    this.exactNess,
    this.redirectURL,
    this.isBBPS,
    this.isBilling,
    this.inSlab,
    this.isTakeCustomerNum,
    this.spKey,
    this.min,
    this.max,
    this.length,
    this.lengthMax,
    this.startWith,
    this.image,
    this.isPartial,
    this.accountName,
    this.accountRemak,
    this.isAccountNumeric,
    this.isGroupLeader,
    this.commSettingType,
    this.minRange,
    this.maxRange,
    this.rangeId,
    this.chargeAmtType,
    this.isPaidAdditional,
    this.isAdditionalServiceType,
    this.stateID,
    this.ind,
    this.accountNoKey,
    this.regExAccount,
    this.customerNoKey,
    this.planDocName,
    this.isAmountValidation,
    this.allowedChannel,
    this.planOID,
    this.rofferOID,
    this.dthCustInfoOID,
    this.dthhrefoid,
    this.rechOID,
    this.allowChannel,
    this.isSpecialOp,
    this.isUtilityOpreator,
    this.opTypeName,
    this.inMultipleOf,
    this.charge,
    this.serviceID,
    this.serviceName,
    this.packageId,
    this.isActive,
    this.isServiceActive,
    this.isVisible,
    this.sCode,
    this.walletTypeID,
    this.selfAssigned,
    this.header,
    this.isHeader = false,
  });

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
    header = json['header'];
    isHeader = json['isHeader'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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

class Cirlces {
  int? id;
  String? circle;
  String? code;

  Cirlces({this.id, this.circle, this.code});

  Cirlces.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    circle = json['circle'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['circle'] = circle;
    data['code'] = code;
    return data;
  }
}