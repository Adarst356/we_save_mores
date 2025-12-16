class GetPlanRofferResponse {
  Data? data;

  dynamic rofferData;
  dynamic dthciData;
  dynamic dthhrData;
  dynamic mobileNo;
  dynamic emailID;
  dynamic outletName;
  dynamic sid;
  dynamic pCode;
  dynamic externalURL;
  dynamic newsContent;

  int? statuscode;
  String? msg;
  int? checkID;
  int? bioAuthType;
  int? rid;

  bool? isVersionValid;
  bool? isAppValid;
  bool? isPasswordExpired;
  bool? isLookUpFromAPI;
  bool? isDTHInfoCall;
  bool? isShowPDFPlan;
  bool? isOTPRequired;
  bool? isBioMetricRequired;
  bool? isDeviceRequired;
  bool? isRedirectToExternal;
  bool? isResendAvailable;
  bool? isDTHInfo;
  bool? isRoffer;
  bool? isGreen;
  bool? isHideService;
  bool? isBulkQRGeneration;
  bool? isSattlemntAccountVerify;
  bool? isEKYCForced;
  bool? isDrawOpImage;
  bool? isAutoVerifyVPA;
  bool? isCoin;
  bool? isB2cMembershipRePurchase;

  GetPlanRofferResponse({
    this.data,
    this.rofferData,
    this.dthciData,
    this.dthhrData,
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

  factory GetPlanRofferResponse.fromJson(Map<String, dynamic> json) {
    return GetPlanRofferResponse(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      rofferData: json['rofferData'],
      dthciData: json['dthciData'],
      dthhrData: json['dthhrData'],
      statuscode: json['statuscode'],
      msg: json['msg'],
      isVersionValid: json['isVersionValid'],
      isAppValid: json['isAppValid'],
      checkID: json['checkID'],
      isPasswordExpired: json['isPasswordExpired'],
      mobileNo: json['mobileNo'],
      emailID: json['emailID'],
      outletName: json['outletName'],
      isLookUpFromAPI: json['isLookUpFromAPI'],
      isDTHInfoCall: json['isDTHInfoCall'],
      isShowPDFPlan: json['isShowPDFPlan'],
      sid: json['sid'],
      pCode: json['pCode'],
      isOTPRequired: json['isOTPRequired'],
      isBioMetricRequired: json['isBioMetricRequired'],
      isDeviceRequired: json['isDeviceRequired'],
      bioAuthType: json['bioAuthType'],
      isRedirectToExternal: json['isRedirectToExternal'],
      externalURL: json['externalURL'],
      isResendAvailable: json['isResendAvailable'],
      isDTHInfo: json['isDTHInfo'],
      isRoffer: json['isRoffer'],
      isGreen: json['isGreen'],
      rid: json['rid'],
      isHideService: json['isHideService'],
      isBulkQRGeneration: json['isBulkQRGeneration'],
      isSattlemntAccountVerify: json['isSattlemntAccountVerify'],
      isEKYCForced: json['isEKYCForced'],
      isDrawOpImage: json['isDrawOpImage'],
      isAutoVerifyVPA: json['isAutoVerifyVPA'],
      isCoin: json['isCoin'],
      isB2cMembershipRePurchase: json['isB2cMembershipRePurchase'],
      newsContent: json['newsContent'],
    );
  }
}


class Data {
  List<Types> types;

  Data({required this.types});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      types: json['types'] != null
          ? List<Types>.from(
        json['types'].map((x) => Types.fromJson(x)),
      )
          : [],
    );
  }
}

class Types {
  String pType;
  List<PDetails> pDetails;

  Types({
    required this.pType,
    required this.pDetails,
  });

  factory Types.fromJson(Map<String, dynamic> json) {
    return Types(
      pType: json['pType'] ?? "",
      pDetails: json['pDetails'] != null
          ? List<PDetails>.from(
        json['pDetails'].map((x) => PDetails.fromJson(x)),
      )
          : [],
    );
  }
}


class PDetails {
  dynamic amount; // kabhi int kabhi string aata hai
  String description;
  String rs;
  String desc;
  String validity;

  PDetails({
    this.amount,
    required this.description,
    required this.rs,
    required this.desc,
    required this.validity,
  });

  factory PDetails.fromJson(Map<String, dynamic> json) {
    return PDetails(
      amount: json['Amount'],
      description: json['Description'] ?? "",
      rs: json['rs'] ?? "",
      desc: json['desc'] ?? "",
      validity: json['validity'] ?? "",
    );
  }
}

