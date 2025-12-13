import 'package:get/get.dart';

class BillPaymentController extends GetxController {
  late int serviceId;
  late String serviceName;
  int? providerId;
  String? providerName;
  String? providerImage;

  // Add these flags to identify service types
  bool get isPrepaid => serviceName.toLowerCase() == "prepaid";
  bool get isDTH => serviceName.toLowerCase() == "dth";
  bool get shouldShowProviderFirst => !isPrepaid && !isDTH;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;

    serviceId = args["serviceId"];
    serviceName = args["serviceName"];
    providerId = args["providerId"];
    providerName = args["providerName"];
    providerImage = args["providerImage"];

    print("Main Service: $serviceName ($serviceId)");
    print("Provider: $providerName ($providerId)");
  }
}