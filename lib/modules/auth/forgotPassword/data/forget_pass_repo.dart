import '../../../../api/api_client.dart';
import '../../../../api/ui_state.dart';
import 'forget_response.dart';

class ForgetPassRepo {
  final GetConnectApiClient _apiClient = GetConnectApiClient.instance;

  Future<void> getForgetPassword(
      Map<String, dynamic> body, {
        required Function(UiState<ForgetPassResponse> state) callback,
      }) async {
    callback(UiState.loading());
    try {
      final res = await _apiClient.getForgetPass(body);

      if (res.status.isOk) {
        final data = ForgetPassResponse.fromJson(res.body);
        callback(UiState.success(data));
      } else {
        callback(UiState.error("Failed to login"));
      }
    } catch (e) {
      callback(UiState.error("Error: $e"));
    }
  }
}