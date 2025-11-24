import 'package:we_save_more/modules/dashboard/drawer/data/logout_response.dart';

import '../../../../../../api/api_client.dart';
import '../../../../../../api/ui_state.dart';



class LogoutRepo {
  final GetConnectApiClient _apiClient = GetConnectApiClient.instance;

  Future<void> getLogoutUser({
    required Map<String, dynamic> body,
    required Function(UiState<LogOutResponse> state) callback,
  }) async {
    callback(UiState.loading());

    try {
      final res = await _apiClient.getLogout(body);

      if (res.status.isOk) {
        final data = LogOutResponse.fromJson(res.body);
        callback(UiState.success(data));
      } else {
        callback(UiState.error("Failed to fetch referral data"));
      }
    } catch (e) {
      callback(UiState.error("Error: $e"));
    }
  }
}
