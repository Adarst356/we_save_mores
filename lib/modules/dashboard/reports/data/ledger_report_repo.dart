import '../../../../../../api/api_client.dart';
import '../../../../../../api/ui_state.dart';
import 'ledger_report_response.dart';

class LedgerReportRepo {
  final GetConnectApiClient _apiClient = GetConnectApiClient.instance;

  Future<void> getLedgerReportData({
    required Map<String, dynamic> body,
    required Function(UiState<LedgerReportResponse> state) callback,
  }) async {
    callback(UiState.loading());

    try {
      final res = await _apiClient.getLedgerReport(body);

      if (res.status.isOk) {
        final data = LedgerReportResponse.fromJson(res.body);
        callback(UiState.success(data));
      } else {
        callback(UiState.error("Failed to fetch Wallet History Details"));
      }
    } catch (e) {
      callback(UiState.error("Error: $e"));
    }
  }
}