class GetOpTypesResponse {
  GetOpTypesResponse({
    required this.data,
    required this.isAddMoneyEnable,
    required this.isPaymentGatway,
    required this.isUpi,
    required this.isUpiqr,
    required this.isECollectEnable,
    required this.isDmtWithPipe,
    required this.statuscode,
    required this.msg,
    required this.isVersionValid,
    required this.isAppValid,
    required this.checkId,
    required this.isPasswordExpired,
    required this.mobileNo,
    required this.emailId,
    required this.outletName,
    required this.isLookUpFromApi,
    required this.isDthInfoCall,
    required this.isShowPdfPlan,
    required this.sid,
    required this.pCode,
    required this.isOtpRequired,
    required this.isBioMetricRequired,
    required this.isDeviceRequired,
    required this.bioAuthType,
    required this.isRedirectToExternal,
    required this.externalUrl,
    required this.isResendAvailable,
    required this.isDthInfo,
    required this.isRoffer,
    required this.isGreen,
    required this.rid,
    required this.isHideService,
    required this.isBulkQrGeneration,
    required this.isSattlemntAccountVerify,
    required this.isEkycForced,
    required this.isDrawOpImage,
    required this.isAutoVerifyVpa,
    required this.isCoin,
    required this.isB2CMembershipRePurchase,
    required this.newsContent,
  });

  final Data? data;
  final bool? isAddMoneyEnable;
  final bool? isPaymentGatway;
  final bool? isUpi;
  final bool? isUpiqr;
  final bool? isECollectEnable;
  final bool? isDmtWithPipe;
  final num? statuscode;
  final String? msg;
  final bool? isVersionValid;
  final bool? isAppValid;
  final num? checkId;
  final bool? isPasswordExpired;
  final dynamic mobileNo;
  final dynamic emailId;
  final dynamic outletName;
  final bool? isLookUpFromApi;
  final bool? isDthInfoCall;
  final bool? isShowPdfPlan;
  final dynamic sid;
  final dynamic pCode;
  final bool? isOtpRequired;
  final bool? isBioMetricRequired;
  final bool? isDeviceRequired;
  final num? bioAuthType;
  final bool? isRedirectToExternal;
  final dynamic externalUrl;
  final bool? isResendAvailable;
  final bool? isDthInfo;
  final bool? isRoffer;
  final bool? isGreen;
  final int? rid;
  final bool? isHideService;
  final bool? isBulkQrGeneration;
  final bool? isSattlemntAccountVerify;
  final bool? isEkycForced;
  final bool? isDrawOpImage;
  final bool? isAutoVerifyVpa;
  final bool? isCoin;
  final bool? isB2CMembershipRePurchase;
  final dynamic newsContent;

  GetOpTypesResponse copyWith({
    Data? data,
    bool? isAddMoneyEnable,
    bool? isPaymentGatway,
    bool? isUpi,
    bool? isUpiqr,
    bool? isECollectEnable,
    bool? isDmtWithPipe,
    num? statuscode,
    String? msg,
    bool? isVersionValid,
    bool? isAppValid,
    num? checkId,
    bool? isPasswordExpired,
    dynamic? mobileNo,
    dynamic? emailId,
    dynamic? outletName,
    bool? isLookUpFromApi,
    bool? isDthInfoCall,
    bool? isShowPdfPlan,
    dynamic? sid,
    dynamic? pCode,
    bool? isOtpRequired,
    bool? isBioMetricRequired,
    bool? isDeviceRequired,
    num? bioAuthType,
    bool? isRedirectToExternal,
    dynamic? externalUrl,
    bool? isResendAvailable,
    bool? isDthInfo,
    bool? isRoffer,
    bool? isGreen,
    int? rid,
    bool? isHideService,
    bool? isBulkQrGeneration,
    bool? isSattlemntAccountVerify,
    bool? isEkycForced,
    bool? isDrawOpImage,
    bool? isAutoVerifyVpa,
    bool? isCoin,
    bool? isB2CMembershipRePurchase,
    dynamic? newsContent,
  }) {
    return GetOpTypesResponse(
      data: data ?? this.data,
      isAddMoneyEnable: isAddMoneyEnable ?? this.isAddMoneyEnable,
      isPaymentGatway: isPaymentGatway ?? this.isPaymentGatway,
      isUpi: isUpi ?? this.isUpi,
      isUpiqr: isUpiqr ?? this.isUpiqr,
      isECollectEnable: isECollectEnable ?? this.isECollectEnable,
      isDmtWithPipe: isDmtWithPipe ?? this.isDmtWithPipe,
      statuscode: statuscode ?? this.statuscode,
      msg: msg ?? this.msg,
      isVersionValid: isVersionValid ?? this.isVersionValid,
      isAppValid: isAppValid ?? this.isAppValid,
      checkId: checkId ?? this.checkId,
      isPasswordExpired: isPasswordExpired ?? this.isPasswordExpired,
      mobileNo: mobileNo ?? this.mobileNo,
      emailId: emailId ?? this.emailId,
      outletName: outletName ?? this.outletName,
      isLookUpFromApi: isLookUpFromApi ?? this.isLookUpFromApi,
      isDthInfoCall: isDthInfoCall ?? this.isDthInfoCall,
      isShowPdfPlan: isShowPdfPlan ?? this.isShowPdfPlan,
      sid: sid ?? this.sid,
      pCode: pCode ?? this.pCode,
      isOtpRequired: isOtpRequired ?? this.isOtpRequired,
      isBioMetricRequired: isBioMetricRequired ?? this.isBioMetricRequired,
      isDeviceRequired: isDeviceRequired ?? this.isDeviceRequired,
      bioAuthType: bioAuthType ?? this.bioAuthType,
      isRedirectToExternal: isRedirectToExternal ?? this.isRedirectToExternal,
      externalUrl: externalUrl ?? this.externalUrl,
      isResendAvailable: isResendAvailable ?? this.isResendAvailable,
      isDthInfo: isDthInfo ?? this.isDthInfo,
      isRoffer: isRoffer ?? this.isRoffer,
      isGreen: isGreen ?? this.isGreen,
      rid: rid ?? this.rid,
      isHideService: isHideService ?? this.isHideService,
      isBulkQrGeneration: isBulkQrGeneration ?? this.isBulkQrGeneration,
      isSattlemntAccountVerify: isSattlemntAccountVerify ?? this.isSattlemntAccountVerify,
      isEkycForced: isEkycForced ?? this.isEkycForced,
      isDrawOpImage: isDrawOpImage ?? this.isDrawOpImage,
      isAutoVerifyVpa: isAutoVerifyVpa ?? this.isAutoVerifyVpa,
      isCoin: isCoin ?? this.isCoin,
      isB2CMembershipRePurchase: isB2CMembershipRePurchase ?? this.isB2CMembershipRePurchase,
      newsContent: newsContent ?? this.newsContent,
    );
  }

  factory GetOpTypesResponse.fromJson(Map<String, dynamic> json){
    return GetOpTypesResponse(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      isAddMoneyEnable: json["isAddMoneyEnable"],
      isPaymentGatway: json["isPaymentGatway"],
      isUpi: json["isUPI"],
      isUpiqr: json["isUPIQR"],
      isECollectEnable: json["isECollectEnable"],
      isDmtWithPipe: json["isDMTWithPipe"],
      statuscode: json["statuscode"],
      msg: json["msg"],
      isVersionValid: json["isVersionValid"],
      isAppValid: json["isAppValid"],
      checkId: json["checkID"],
      isPasswordExpired: json["isPasswordExpired"],
      mobileNo: json["mobileNo"],
      emailId: json["emailID"],
      outletName: json["outletName"],
      isLookUpFromApi: json["isLookUpFromAPI"],
      isDthInfoCall: json["isDTHInfoCall"],
      isShowPdfPlan: json["isShowPDFPlan"],
      sid: json["sid"],
      pCode: json["pCode"],
      isOtpRequired: json["isOTPRequired"],
      isBioMetricRequired: json["isBioMetricRequired"],
      isDeviceRequired: json["isDeviceRequired"],
      bioAuthType: json["bioAuthType"],
      isRedirectToExternal: json["isRedirectToExternal"],
      externalUrl: json["externalURL"],
      isResendAvailable: json["isResendAvailable"],
      isDthInfo: json["isDTHInfo"],
      isRoffer: json["isRoffer"],
      isGreen: json["isGreen"],
      rid: json["rid"],
      isHideService: json["isHideService"],
      isBulkQrGeneration: json["isBulkQRGeneration"],
      isSattlemntAccountVerify: json["isSattlemntAccountVerify"],
      isEkycForced: json["isEKYCForced"],
      isDrawOpImage: json["isDrawOpImage"],
      isAutoVerifyVpa: json["isAutoVerifyVPA"],
      isCoin: json["isCoin"],
      isB2CMembershipRePurchase: json["isB2cMembershipRePurchase"],
      newsContent: json["newsContent"],
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "isAddMoneyEnable": isAddMoneyEnable,
    "isPaymentGatway": isPaymentGatway,
    "isUPI": isUpi,
    "isUPIQR": isUpiqr,
    "isECollectEnable": isECollectEnable,
    "isDMTWithPipe": isDmtWithPipe,
    "statuscode": statuscode,
    "msg": msg,
    "isVersionValid": isVersionValid,
    "isAppValid": isAppValid,
    "checkID": checkId,
    "isPasswordExpired": isPasswordExpired,
    "mobileNo": mobileNo,
    "emailID": emailId,
    "outletName": outletName,
    "isLookUpFromAPI": isLookUpFromApi,
    "isDTHInfoCall": isDthInfoCall,
    "isShowPDFPlan": isShowPdfPlan,
    "sid": sid,
    "pCode": pCode,
    "isOTPRequired": isOtpRequired,
    "isBioMetricRequired": isBioMetricRequired,
    "isDeviceRequired": isDeviceRequired,
    "bioAuthType": bioAuthType,
    "isRedirectToExternal": isRedirectToExternal,
    "externalURL": externalUrl,
    "isResendAvailable": isResendAvailable,
    "isDTHInfo": isDthInfo,
    "isRoffer": isRoffer,
    "isGreen": isGreen,
    "rid": rid,
    "isHideService": isHideService,
    "isBulkQRGeneration": isBulkQrGeneration,
    "isSattlemntAccountVerify": isSattlemntAccountVerify,
    "isEKYCForced": isEkycForced,
    "isDrawOpImage": isDrawOpImage,
    "isAutoVerifyVPA": isAutoVerifyVpa,
    "isCoin": isCoin,
    "isB2cMembershipRePurchase": isB2CMembershipRePurchase,
    "newsContent": newsContent,
  };

  @override
  String toString(){
    return "$data, $isAddMoneyEnable, $isPaymentGatway, $isUpi, $isUpiqr, $isECollectEnable, $isDmtWithPipe, $statuscode, $msg, $isVersionValid, $isAppValid, $checkId, $isPasswordExpired, $mobileNo, $emailId, $outletName, $isLookUpFromApi, $isDthInfoCall, $isShowPdfPlan, $sid, $pCode, $isOtpRequired, $isBioMetricRequired, $isDeviceRequired, $bioAuthType, $isRedirectToExternal, $externalUrl, $isResendAvailable, $isDthInfo, $isRoffer, $isGreen, $rid, $isHideService, $isBulkQrGeneration, $isSattlemntAccountVerify, $isEkycForced, $isDrawOpImage, $isAutoVerifyVpa, $isCoin, $isB2CMembershipRePurchase, $newsContent, ";
  }
}

class Data {
  Data({
    required this.assignedOpTypes,
  });

  final List<AssignedOpType> assignedOpTypes;

  Data copyWith({
    List<AssignedOpType>? assignedOpTypes,
  }) {
    return Data(
      assignedOpTypes: assignedOpTypes ?? this.assignedOpTypes,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      assignedOpTypes: json["assignedOpTypes"] == null ? [] : List<AssignedOpType>.from(json["assignedOpTypes"]!.map((x) => AssignedOpType.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "assignedOpTypes": assignedOpTypes.map((x) => x?.toJson()).toList(),
  };

  @override
  String toString(){
    return "$assignedOpTypes, ";
  }
}

class AssignedOpType {
  AssignedOpType({
    required this.serviceId,
    required this.parentId,
    required this.isServiceActive,
    required this.isShowMore,
    required this.isPaidAdditional,
    required this.upline,
    required this.uplineMobile,
    required this.ccContact,
    required this.name,
    required this.service,
    required this.sCode,
    required this.isActive,
    required this.isDisplayService,
    required this.isAdditionalServiceType,
    required this.serviceTypeId,
    required this.isTopOptype,
  });

  final num? serviceId;
  final num? parentId;
  final bool? isServiceActive;
  final bool? isShowMore;
  final bool? isPaidAdditional;
  final String? upline;
  final String? uplineMobile;
  final String? ccContact;
  final String? name;
  final String? service;
  final String? sCode;
  final bool? isActive;
  final bool? isDisplayService;
  final bool? isAdditionalServiceType;
  final String? serviceTypeId;
  final bool? isTopOptype;

  AssignedOpType copyWith({
    num? serviceId,
    num? parentId,
    bool? isServiceActive,
    bool? isShowMore,
    bool? isPaidAdditional,
    String? upline,
    String? uplineMobile,
    String? ccContact,
    String? name,
    String? service,
    String? sCode,
    bool? isActive,
    bool? isDisplayService,
    bool? isAdditionalServiceType,
    String? serviceTypeId,
    bool? isTopOptype,
  }) {
    return AssignedOpType(
      serviceId: serviceId ?? this.serviceId,
      parentId: parentId ?? this.parentId,
      isServiceActive: isServiceActive ?? this.isServiceActive,
      isShowMore: isShowMore ?? this.isShowMore,
      isPaidAdditional: isPaidAdditional ?? this.isPaidAdditional,
      upline: upline ?? this.upline,
      uplineMobile: uplineMobile ?? this.uplineMobile,
      ccContact: ccContact ?? this.ccContact,
      name: name ?? this.name,
      service: service ?? this.service,
      sCode: sCode ?? this.sCode,
      isActive: isActive ?? this.isActive,
      isDisplayService: isDisplayService ?? this.isDisplayService,
      isAdditionalServiceType: isAdditionalServiceType ?? this.isAdditionalServiceType,
      serviceTypeId: serviceTypeId ?? this.serviceTypeId,
      isTopOptype: isTopOptype ?? this.isTopOptype,
    );
  }

  factory AssignedOpType.fromJson(Map<String, dynamic> json){
    return AssignedOpType(
      serviceId: json["serviceID"],
      parentId: json["parentID"],
      isServiceActive: json["isServiceActive"],
      isShowMore: json["isShowMore"],
      isPaidAdditional: json["isPaidAdditional"],
      upline: json["upline"],
      uplineMobile: json["uplineMobile"],
      ccContact: json["ccContact"],
      name: json["name"],
      service: json["service"],
      sCode: json["sCode"],
      isActive: json["isActive"],
      isDisplayService: json["isDisplayService"],
      isAdditionalServiceType: json["isAdditionalServiceType"],
      serviceTypeId: json["serviceTypeID"],
      isTopOptype: json["isTopOptype"],
    );
  }

  Map<String, dynamic> toJson() => {
    "serviceID": serviceId,
    "parentID": parentId,
    "isServiceActive": isServiceActive,
    "isShowMore": isShowMore,
    "isPaidAdditional": isPaidAdditional,
    "upline": upline,
    "uplineMobile": uplineMobile,
    "ccContact": ccContact,
    "name": name,
    "service": service,
    "sCode": sCode,
    "isActive": isActive,
    "isDisplayService": isDisplayService,
    "isAdditionalServiceType": isAdditionalServiceType,
    "serviceTypeID": serviceTypeId,
    "isTopOptype": isTopOptype,
  };

  @override
  String toString(){
    return "$serviceId, $parentId, $isServiceActive, $isShowMore, $isPaidAdditional, $upline, $uplineMobile, $ccContact, $name, $service, $sCode, $isActive, $isDisplayService, $isAdditionalServiceType, $serviceTypeId, $isTopOptype, ";
  }
}
