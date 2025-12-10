import 'package:we_save_more/modules/dashboard/home_dashboard/data/banner_response.dart';
import '../../../../../../api/api_client.dart';
import '../../../../../../api/ui_state.dart';
import 'getop_type_response.dart';

class GetOpTypeRepo {
  final GetConnectApiClient _apiClient = GetConnectApiClient.instance;
  Future<void> getOpTypeData({
    required Map<String, dynamic> body,
    required Function(UiState<GetOpTypesResponse> state) callback,
  }) async {
    callback(UiState.loading());

    try {
      final res = await _apiClient.getOpType(body);

      if (res.status.isOk) {
        final data = GetOpTypesResponse.fromJson(res.body);
        callback(UiState.success(data));
      } else {
        callback(UiState.error("Failed to fetch OpTypeDetails "));
      }
    } catch (e) {
      callback(UiState.error("Error: $e"));
    }
  }
}