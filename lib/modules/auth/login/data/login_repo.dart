import '../../../../api/api_client.dart';
import '../../../../api/ui_state.dart';
import 'login_response.dart';

class LoginRepo {
  final GetConnectApiClient _apiClient = GetConnectApiClient.instance;

  Future<void> getLoginUser(
      Map<String, dynamic> body, {
        required Function(UiState<LoginResponse> state) callback,
      }) async {
    callback(UiState.loading());
    try {
      final res = await _apiClient.getLogin(body);

      if (res.status.isOk) {
        final data = LoginResponse.fromJson(res.body);
        callback(UiState.success(data));
      } else {
        callback(UiState.error("Failed to login"));
      }
    } catch (e) {
      callback(UiState.error("Error: $e"));
    }
  }
}
