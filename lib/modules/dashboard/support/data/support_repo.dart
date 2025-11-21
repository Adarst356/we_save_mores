import '../../../../api/api_client.dart';
import '../../../../api/ui_state.dart';
import 'support_response.dart';

class SupportRepo {
  final GetConnectApiClient _apiClient = GetConnectApiClient.instance;

  Future<void> getCompanyProfile({
    required Map<String, dynamic> body,
    required Function(UiState<CompanyProfileResponse> state) callback,
  }) async {
    callback(UiState.loading());

    try {
      final res = await _apiClient.getCompanyProfile(body);

      if (res.status.isOk) {
        final data = CompanyProfileResponse.fromJson(res.body);
        callback(UiState.success(data));
      } else {
        callback(UiState.error("Failed to fetch support data"));
      }
    } catch (e) {
      callback(UiState.error("Error: $e"));
    }
  }
}
