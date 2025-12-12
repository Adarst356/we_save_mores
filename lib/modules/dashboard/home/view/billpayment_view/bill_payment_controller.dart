import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BillPaymentController extends GetxController {
  late int serviceId;
  late String serviceName;
  int? providerId;
  String? providerName;
  String? providerImage;

  @override
  void onInit() {
    final args = Get.arguments;

    serviceId = args["serviceId"];
    serviceName = args["serviceName"];


    print("Main Service: $serviceName  ($serviceId)");


    super.onInit();
  }
}
