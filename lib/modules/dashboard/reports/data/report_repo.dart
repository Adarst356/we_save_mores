import 'package:we_save_more/modules/dashboard/reports/data/report_response.dart';

import '../../../../api/api_client.dart';
import '../../../../api/ui_state.dart';

class ReportRepo {
  final GetConnectApiClient _apiClient = GetConnectApiClient.instance;

  Future<void> getReport({
    required Map<String, dynamic> body,
    required Function(UiState<TransactionResponse> state) callback,
  }) async {
    callback(UiState.loading());

    try {
      final res = await _apiClient.getReport(body);

      if (res.status.isOk) {
        final data = TransactionResponse.fromJson(res.body);
        callback(UiState.success(data));
      } else {
        callback(UiState.error("Failed to fetch support data"));
      }
    } catch (e) {
      callback(UiState.error("Error: $e"));
    }
  }
}
