import '../../../../../../api/api_client.dart';
import '../../../../../../api/ui_state.dart';
import 'banner_response.dart';

class BannerRepo {
  final GetConnectApiClient _apiClient = GetConnectApiClient.instance;

  Future<void> getBannerData({
    required Map<String, dynamic> body,
    required Function(UiState<GetBannerResponse> state) callback,
  }) async {
    callback(UiState.loading());

    try {
      final res = await _apiClient.getBannerDetail(body);

      if (res.status.isOk) {
        final data = GetBannerResponse.fromJson(res.body);
        callback(UiState.success(data));
      } else {
        callback(UiState.error("Failed to fetch Banner "));
      }
    } catch (e) {
      callback(UiState.error("Error: $e"));
    }
  }
}
