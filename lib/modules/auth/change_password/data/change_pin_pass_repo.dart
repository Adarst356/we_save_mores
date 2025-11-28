import 'package:we_save_more/modules/auth/change_password/data/change_pin_pass_reposonse.dart';

import '../../../../api/api_client.dart';
import '../../../../api/ui_state.dart';


class ChangePinPassRepo {
  final GetConnectApiClient _apiClient = GetConnectApiClient.instance;

  Future<void> getChangePinOrPass(
      Map<String, dynamic> body, {
        required Function(UiState<ChangePassPinResponse> state) callback,
      }) async {
    callback(UiState.loading());
    try {
      final res = await _apiClient.getChangePassPin(body);

      if (res.status.isOk) {
        final data = ChangePassPinResponse.fromJson(res.body);
        callback(UiState.success(data));
      } else {
        callback(UiState.error("Failed to login"));
      }
    } catch (e) {
      callback(UiState.error("Error: $e"));
    }
  }
}