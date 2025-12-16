import '../../../../../../api/api_client.dart';
import '../../../../../../api/ui_state.dart';
import 'billpayment_response.dart';
import 'get_plan_Roffer_response.dart';


class GetPlanRofferRepo {
  final GetConnectApiClient _apiClient = GetConnectApiClient.instance;

  Future<void> getPlanRofferData({
    required Map<String, dynamic> body,
    required Function(UiState<GetPlanRofferResponse> state) callback,
  }) async {
    callback(UiState.loading());

    try {
      final res = await _apiClient.getPlanROffer(body);

      if (res.status.isOk) {
        final data = GetPlanRofferResponse.fromJson(res.body);
        callback(UiState.success(data));
      } else {
        callback(UiState.error("Failed to fetch OpTypeDetails "));
      }
    } catch (e) {
      callback(UiState.error("Error: $e"));
    }
  }
}
