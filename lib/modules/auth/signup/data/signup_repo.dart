import '../../../../api/api_client.dart';
import '../../../../api/ui_state.dart';
import 'signup_response.dart';

class SignupRepo {
  final GetConnectApiClient _apiClient = GetConnectApiClient.instance;

  Future<void> signupUser(
      Map<String, dynamic> body, {
        required Function(UiState<SignupResponse> state) callback,
      }) async {
    callback(UiState.loading());
    try {
      final res = await _apiClient.getSignup(body);

      if (res.status.isOk) {
        final data = SignupResponse.fromJson(res.body);
        callback(UiState.success(data));
      } else {
        callback(UiState.error("Failed to signup"));
      }
    } catch (e) {
      callback(UiState.error("Error: $e"));
    }
  }
}
