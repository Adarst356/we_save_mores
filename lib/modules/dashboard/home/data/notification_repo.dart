import '../../../../../../api/api_client.dart';
import '../../../../../../api/ui_state.dart';
import 'notification_response.dart';

class NotificationRepo {
  final GetConnectApiClient _apiClient = GetConnectApiClient.instance;

  Future<void> getNotificationData({
    required Map<String, dynamic> body,
    required Function(UiState<NotificationResponse> state) callback,
  }) async {
    callback(UiState.loading());

    try {
      final res = await _apiClient.getAppNotification(body);

      if (res.status.isOk) {
        final data = NotificationResponse.fromJson(res.body);
        callback(UiState.success(data));
      } else {
        callback(UiState.error("Failed to fetch Notification Details"));
      }
    } catch (e) {
      callback(UiState.error("Error: $e"));
    }
  }
}