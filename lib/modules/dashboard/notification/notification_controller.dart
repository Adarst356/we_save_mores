import 'package:get/get.dart';
import 'package:app_badge_plus/app_badge_plus.dart';
import '../../../api/ui_state.dart';
import '../home/data/notification_repo.dart';
import '../home/data/notification_response.dart';

class NotificationController extends GetxController {
  final NotificationRepo repo = NotificationRepo();

  RxInt notificationCount = 0.obs;
  RxList<Notifications> notifications = <Notifications>[].obs;

  Rx<UiState<NotificationResponse>> notificationState =
      UiState<NotificationResponse>.none().obs;

  @override
  void onInit() {
    super.onInit();
    getNotification();
  }

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

            // Parse notifications properly
            if (data.notifications != null) {
              notifications.value = (data.notifications as List)
                  .map((json) => Notifications.fromJson(json))
                  .toList();
            } else {
              notifications.value = [];
            }

            // Count unseen
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

  Future<void> updateBadge(int count) async {
    notificationCount.value = count;

    try {
      if (count > 0) {
        await AppBadgePlus.updateBadge(count);
      } else {
        await AppBadgePlus.updateBadge(0);
      }
    } catch (e) {
      print("Badge Update Error: $e");
    }
  }

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

  Future<void> markAllAsRead() async {
    for (var n in notifications) {
      n.isSeen = true;
    }
    notifications.refresh();
    updateBadge(0);
  }

  Future<void> refreshNotifications() async {
    await getNotification();
  }
}