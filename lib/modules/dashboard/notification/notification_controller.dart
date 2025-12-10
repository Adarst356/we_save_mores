import 'package:get/get.dart';
import 'package:app_badge_plus/app_badge_plus.dart';

import '../../../api/ui_state.dart';
import '../home_dashboard/data/notification_repo.dart';
import '../home_dashboard/data/notification_response.dart';

class NotificationController extends GetxController {
  final NotificationRepo repo = NotificationRepo();

  /// Count of unread notifications
  RxInt notificationCount = 0.obs;

  /// List of notifications
  RxList<Notifications> notifications = <Notifications>[].obs;

  /// UI State holder
  Rx<UiState<NotificationResponse>> notificationState =
      UiState<NotificationResponse>.none().obs;

  @override
  void onInit() {
    super.onInit();
    getNotification();
  }

  /// API Call
  Future<void> getNotification() async {
    notificationState.value = UiState.loading();

    final body = {
      "IsB2C": false,
      "imei": "",
      "loginTypeID": 1,
      "opType": 0,
      "regKey": "",
      "serialNo": "",
      "uid": 0,
    };

    await repo.getNotificationData(
      body: body,
      callback: (state) {
        state.when(
          loading: () {
            notificationState.value = UiState.loading();
          },

          success: (data) {
            notificationState.value = UiState.success(data);

            /// Update notifications list
            notifications.value = data.notifications ?? [];

            /// Count unseen notifications
            int unseen = notifications.where((n) => n.isSeen == false).length;

            updateBadge(unseen);
          },

          error: (message) {
            notificationState.value = UiState.error(message);
            updateBadge(0);
          },

          none: () {},
        );
      },
    );
  }

  /// Update app + system badge
  Future<void> updateBadge(int count) async {
    notificationCount.value = count;

    try {
      await AppBadgePlus.updateBadge(count);
    } catch (e) {
      print("Badge Update Error: $e");
    }
  }

  /// Mark a single notification as read
  Future<void> markAsRead(int? id) async {
    if (id == null) return;

    int index = notifications.indexWhere((n) => n.id == id);

    if (index != -1 && notifications[index].isSeen == false) {
      notifications[index].isSeen = true;
      notifications.refresh();

      int unseen = notifications.where((n) => n.isSeen == false).length;
      updateBadge(unseen);
    }
  }

  /// Mark all notifications read
  Future<void> markAllAsRead() async {
    for (var n in notifications) {
      n.isSeen = true;
    }
    notifications.refresh();
    updateBadge(0);
  }

  /// Pull to refresh
  Future<void> refreshNotifications() async {
    await getNotification();
  }
}
