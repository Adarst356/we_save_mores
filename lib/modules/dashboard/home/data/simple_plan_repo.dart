import 'package:we_save_more/modules/dashboard/home/data/redeem_card_response.dart';
import 'package:we_save_more/modules/dashboard/home/data/simple_plan_response.dart';
import '../../../../../../api/api_client.dart';
import '../../../../../../api/ui_state.dart';

class SimplePlanRepo {
  final GetConnectApiClient _apiClient = GetConnectApiClient.instance;

  Future<void> getSimplePlanData({
    required Map<String, dynamic> body,
    required Function(UiState<GetSimpleRechPlan> state) callback,
  }) async {
    callback(UiState.loading());

    try {
      final res = await _apiClient.getRechSimplePlan(body);

      if (res.status.isOk) {
        final data = GetSimpleRechPlan.fromJson(res.body);
        callback(UiState.success(data));
      } else {
        callback(UiState.error("Failed to fetch Simple Plan Data"));
      }
    } catch (e) {
      callback(UiState.error("Error: $e"));
    }
  }
}