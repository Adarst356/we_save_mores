import '../../../../../../api/api_client.dart';
import '../../../../../../api/ui_state.dart';
import 'billpayment_response.dart';


class BillPaymentRepo {
  final GetConnectApiClient _apiClient = GetConnectApiClient.instance;

  Future<void> getNumberListData({
    required Map<String, dynamic> body,
    required Function(UiState<GetNumberList> state) callback,
  }) async {
    callback(UiState.loading());

    try {
      final res = await _apiClient.getNumberList(body);

      if (res.status.isOk) {
        final data = GetNumberList.fromJson(res.body);
        callback(UiState.success(data));
      } else {
        callback(UiState.error("Failed to fetch OpTypeDetails "));
      }
    } catch (e) {
      callback(UiState.error("Error: $e"));
    }
  }
}
