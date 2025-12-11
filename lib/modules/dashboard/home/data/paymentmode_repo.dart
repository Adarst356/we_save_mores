import 'package:we_save_more/modules/dashboard/home/data/paymentmode_response.dart';
import '../../../../../../api/api_client.dart';
import '../../../../../../api/ui_state.dart';

class PaymentModeRepo {
  final GetConnectApiClient _apiClient = GetConnectApiClient.instance;

  Future<void> getPaymentMode({
    required Map<String, dynamic> body,
    required Function(UiState<PaymentModeResponse> state) callback,
  }) async {
    callback(UiState.loading());

    try {
      final res = await _apiClient.getPaymentMethod(body);

      if (res.status.isOk) {
        final data = PaymentModeResponse.fromJson(res.body);
        callback(UiState.success(data));
      } else {
        callback(UiState.error("Failed to fetch payment modes"));
      }
    } catch (e) {
      callback(UiState.error("Error: $e"));
    }
  }
}