import 'package:we_save_more/modules/dashboard/home_dashboard/data/pg_details_response.dart';
import '../../../../../../api/api_client.dart';
import '../../../../../../api/ui_state.dart';

class PgDetailsRepo {
  final GetConnectApiClient _apiClient = GetConnectApiClient.instance;

  Future<void> getPGDetails({
    required Map<String, dynamic> body,
    required Function(UiState<GetPGDetailResponse> state) callback,
  }) async {
    callback(UiState.loading());

    try {
      final res = await _apiClient.getPGDetails(body);

      if (res.status.isOk) {
        final data = GetPGDetailResponse.fromJson(res.body);
        callback(UiState.success(data));
      } else {
        callback(UiState.error("Failed to fetch PG details"));
      }
    } catch (e) {
      callback(UiState.error("Error: $e"));
    }
  }
}