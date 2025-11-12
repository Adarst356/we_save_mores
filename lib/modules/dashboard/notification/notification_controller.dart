import 'package:get/get.dart';
import 'package:app_badge_plus/app_badge_plus.dart';

class NotificationController extends GetxController {
  var notificationCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _initBadge();
  }

  /// Initialize badge on app open
  Future<void> _initBadge() async {
    await AppBadgePlus.updateBadge(notificationCount.value);
  }

  /// Fetch from API (for demo we fake it)
  Future<void> fetchNotifications() async {
    await Future.delayed(const Duration(seconds: 1));
    updateBadge(12); // Replace with API count
  }

  /// Update both app UI + system badge
  Future<void> updateBadge(int count) async {
    notificationCount.value = count;

    if (count > 0) {
      await AppBadgePlus.updateBadge(count);
    } else {
      await AppBadgePlus.updateBadge(0);
    }
  }

  /// Clear notifications
  Future<void> clearNotifications() async {
    await AppBadgePlus.updateBadge(0);
    notificationCount.value = 0;
  }
}
