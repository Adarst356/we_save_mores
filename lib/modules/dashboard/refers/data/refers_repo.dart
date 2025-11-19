import '../../../../../../api/api_client.dart';
import '../../../../../../api/ui_state.dart';
import 'refers_response.dart';


class ReferralRepo {
  final GetConnectApiClient _apiClient = GetConnectApiClient.instance;

  Future<void> getReferral({
    required Map<String, dynamic> body,
    required Function(UiState<ReferralResponse> state) callback,
  }) async {
    callback(UiState.loading());

    try {
      final res = await _apiClient.getReferralContent(body);

      if (res.status.isOk) {
        final data = ReferralResponse.fromJson(res.body);
        callback(UiState.success(data));
      } else {
        callback(UiState.error("Failed to fetch referral data"));
      }
    } catch (e) {
      callback(UiState.error("Error: $e"));
    }
  }
}
