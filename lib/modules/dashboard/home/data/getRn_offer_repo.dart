import '../../../../../../api/api_client.dart';
import '../../../../../../api/ui_state.dart';
import 'getRn_offer_response.dart';


class GetRnOfferRepo {
  final GetConnectApiClient _apiClient = GetConnectApiClient.instance;

  Future<void> getPlanRofferData({
    required Map<String, dynamic> body,
    required Function(UiState<GetRNPRofferResponse> state) callback,
  }) async {
    callback(UiState.loading());

    try {
      final res = await _apiClient.getRNROffer(body);

      if (res.status.isOk) {
        final data = GetRNPRofferResponse.fromJson(res.body);
        callback(UiState.success(data));
      } else {
        callback(UiState.error("Failed to fetch GetPlanRoffer data "));
      }
    } catch (e) {
      callback(UiState.error("Error: $e"));
    }
  }
}
