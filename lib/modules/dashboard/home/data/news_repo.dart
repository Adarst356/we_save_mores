import '../../../../../../api/api_client.dart';
import '../../../../../../api/ui_state.dart';
import 'news_response.dart';

class NewsRepo {
  final GetConnectApiClient _apiClient = GetConnectApiClient.instance;

  Future<void> getNewsDetailsData({
    required Map<String, dynamic> body,
    required Function(UiState<NewsResponse> state) callback,
  }) async {
    callback(UiState.loading());

    try {
      final res = await _apiClient.getNewsDetail(body);

      if (res.status.isOk) {
        final data = NewsResponse.fromJson(res.body);
        callback(UiState.success(data));
      } else {
        callback(UiState.error("Failed to fetch News Details"));
      }
    } catch (e) {
      callback(UiState.error("Error: $e"));
    }
  }
}