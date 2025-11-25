class ProfileResponse {
  String? name;
  String? alternateMobile;
  String? dob;
  String? pan;
  String? pincode;
  String? city;
  String? state;
  String? address;
  String? aadhar;
  dynamic profilePic;
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

  ProfileResponse({
    this.name,
    this.alternateMobile,
    this.dob,
    this.pan,
    this.pincode,
    this.city,
    this.state,
    this.address,
    this.aadhar,
    this.profilePic,
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

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alternateMobile = json['alternateMobile'];
    dob = json['dob'];
    pan = json['pan'];
    pincode = json['pincode'];
    city = json['city'];
    state = json['state'];
    address = json['address'];
    aadhar = json['aadhar'];
    profilePic = json['profilePic'];
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
    data['name'] = name;
    data['alternateMobile'] = alternateMobile;
    data['dob'] = dob;
    data['pan'] = pan;
    data['pincode'] = pincode;
    data['city'] = city;
    data['state'] = state;
    data['address'] = address;
    data['aadhar'] = aadhar;
    data['profilePic'] = profilePic;
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
