import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/reports/view/rechargeReport/report_controller.dart';

class MainNavigationController extends GetxController {
  static get to => Get.find();
  var selectedIndex = 0.obs;
final ReportController controller = Get.put(ReportController());
  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}