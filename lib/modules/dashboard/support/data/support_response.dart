class SupportResponse {
  String? name;
  String? address;
  String? emailId;
  String? phoneNo;
  String? mobileNo;
  dynamic mobileNo2;
  String? accountMobileNo;
  String? accountEmailId;
  String? facebook;
  String? instagram;
  String? twitter;
  String? whatsApp;
  String? website;
  String? headerTitle;
  String? customerCareMobileNos;
  String? customerCareEmailIds;
  String? customerPhoneNos;
  String? customerWhatsAppNos;
  String? accountPhoneNos;
  String? accountWhatsAppNos;
  dynamic salesPersonNo;
  dynamic salesPersonEmail;
  String? appName;
  String? ownerName;
  String? ownerDesignation;
  int? statuscode;
  int? kycStatus;
  dynamic msg;
  dynamic pan;
  dynamic userAddress;
  int? signupReferalID;
  bool? isOutletRequired;

  SupportResponse(
      {this.name,
        this.address,
        this.emailId,
        this.phoneNo,
        this.mobileNo,
        this.mobileNo2,
        this.accountMobileNo,
        this.accountEmailId,
        this.facebook,
        this.instagram,
        this.twitter,
        this.whatsApp,
        this.website,
        this.headerTitle,
        this.customerCareMobileNos,
        this.customerCareEmailIds,
        this.customerPhoneNos,
        this.customerWhatsAppNos,
        this.accountPhoneNos,
        this.accountWhatsAppNos,
        this.salesPersonNo,
        this.salesPersonEmail,
        this.appName,
        this.ownerName,
        this.ownerDesignation,
        this.statuscode,
        this.kycStatus,
        this.msg,
        this.pan,
        this.userAddress,
        this.signupReferalID,
        this.isOutletRequired});

  SupportResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    emailId = json['emailId'];
    phoneNo = json['phoneNo'];
    mobileNo = json['mobileNo'];
    mobileNo2 = json['mobileNo2'];
    accountMobileNo = json['accountMobileNo'];
    accountEmailId = json['accountEmailId'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    whatsApp = json['whatsApp'];
    website = json['website'];
    headerTitle = json['headerTitle'];
    customerCareMobileNos = json['customerCareMobileNos'];
    customerCareEmailIds = json['customerCareEmailIds'];
    customerPhoneNos = json['customerPhoneNos'];
    customerWhatsAppNos = json['customerWhatsAppNos'];
    accountPhoneNos = json['accountPhoneNos'];
    accountWhatsAppNos = json['accountWhatsAppNos'];
    salesPersonNo = json['salesPersonNo'];
    salesPersonEmail = json['salesPersonEmail'];
    appName = json['appName'];
    ownerName = json['ownerName'];
    ownerDesignation = json['ownerDesignation'];
    statuscode = json['statuscode'];
    kycStatus = json['kycStatus'];
    msg = json['msg'];
    pan = json['pan'];
    userAddress = json['userAddress'];
    signupReferalID = json['signupReferalID'];
    isOutletRequired = json['isOutletRequired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['emailId'] = this.emailId;
    data['phoneNo'] = this.phoneNo;
    data['mobileNo'] = this.mobileNo;
    data['mobileNo2'] = this.mobileNo2;
    data['accountMobileNo'] = this.accountMobileNo;
    data['accountEmailId'] = this.accountEmailId;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['twitter'] = this.twitter;
    data['whatsApp'] = this.whatsApp;
    data['website'] = this.website;
    data['headerTitle'] = this.headerTitle;
    data['customerCareMobileNos'] = this.customerCareMobileNos;
    data['customerCareEmailIds'] = this.customerCareEmailIds;
    data['customerPhoneNos'] = this.customerPhoneNos;
    data['customerWhatsAppNos'] = this.customerWhatsAppNos;
    data['accountPhoneNos'] = this.accountPhoneNos;
    data['accountWhatsAppNos'] = this.accountWhatsAppNos;
    data['salesPersonNo'] = this.salesPersonNo;
    data['salesPersonEmail'] = this.salesPersonEmail;
    data['appName'] = this.appName;
    data['ownerName'] = this.ownerName;
    data['ownerDesignation'] = this.ownerDesignation;
    data['statuscode'] = this.statuscode;
    data['kycStatus'] = this.kycStatus;
    data['msg'] = this.msg;
    data['pan'] = this.pan;
    data['userAddress'] = this.userAddress;
    data['signupReferalID'] = this.signupReferalID;
    data['isOutletRequired'] = this.isOutletRequired;
    return data;
  }
}
