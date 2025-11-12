import 'package:get/get.dart';
import 'package:app_badge_plus/app_badge_plus.dart';

class NotificationController extends GetxController {
  RxInt notificationCount = 0.obs;

  void setCount(int value) {
    notificationCount.value = value;
    AppBadgePlus.updateBadge(value);
  }

  void increment() {
    notificationCount.value++;
    AppBadgePlus.updateBadge(notificationCount.value);
  }

  void clear() {
    notificationCount.value = 0;
    AppBadgePlus.updateBadge(0);
  }
}
