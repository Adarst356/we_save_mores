import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// Controller me yeh add karo
class BillPaymentController extends GetxController {
  late int serviceId;
  late String serviceName;
  int? providerId;
  String? providerName;
  String? providerImage;
  int? oid;
  RxString selectedPlanDesc = ''.obs;
  bool get isPrepaid => serviceName.toLowerCase() == "prepaid";
  bool get isDTH => serviceName.toLowerCase() == "dth";
  bool get shouldShowProviderFirst => !isPrepaid && !isDTH;

  TextEditingController mobileNoController = TextEditingController(text: "");
  TextEditingController amountController = TextEditingController();
  // Add this for digit count
  RxInt mobileDigitCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;

    serviceId = args["serviceId"];
    serviceName = args["serviceName"];
    providerId = args["providerId"];
    providerName = args["providerName"];
    providerImage = args["providerImage"];
    /// ✅ Agar ViewPlan se data aaya ho
    if (args["amount"] != null) {
      amountController.text = args["amount"].toString();
      selectedPlanDesc.value = args["description"] ?? '';
    }


    // Listen to text changes
    mobileNoController.addListener(() {
      mobileDigitCount.value = mobileNoController.text.length;
    });

    print("Main Service: $serviceName ($serviceId)");
    print("Provider: $providerName ($providerId)");
  }

  @override
  void onClose() {
    mobileNoController.dispose();
    super.onClose();
  }
}
