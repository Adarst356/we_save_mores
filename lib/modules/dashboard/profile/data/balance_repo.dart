import 'package:we_save_more/modules/dashboard/profile/data/balance_response.dart';
import '../../../../../../api/api_client.dart';
import '../../../../../../api/ui_state.dart';

class  BalanceRepo{
  final GetConnectApiClient _apiClient = GetConnectApiClient.instance;
  Future<void> getBalanceData({
    required Map<String, dynamic> body,
    required Function(UiState<BalanceResponse> state) callback,
  }) async {
    callback(UiState.loading());

    try {
      final res = await _apiClient.getBalance(body);

      if (res.status.isOk) {
        final data = BalanceResponse.fromJson(res.body);
        callback(UiState.success(data));
      } else {
        callback(UiState.error("Failed to fetch referral data"));
      }
    } catch (e) {
      callback(UiState.error("Error: $e"));
    }
  }
}
