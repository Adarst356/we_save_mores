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
      print("📤 API Request Body: $body");
      final res = await _apiClient.getReport(body);
      print("📥 API Response Status: ${res.statusCode}");
      print("📥 API Response Body: ${res.body}");
      if (res.status.isOk && res.body != null) {
        try {
          final data = TransactionResponse.fromJson(res.body);
          print("✅ Parsed TransactionResponse");
          print("   Status Code: ${data.statuscode}");
          print("   Message: ${data.msg}");
          print("   Reports Count: ${data.rechargeReport?.length ?? 0}");
          callback(UiState.success(data));
        } catch (parseError) {
          print("❌ JSON Parsing Error: $parseError");
          callback(UiState.error("Failed to parse response: $parseError"));
        }
      } else {
        final errorMsg = "Failed to fetch report data. Status: ${res.statusCode}";
        print("❌$errorMsg");
        callback(UiState.error(errorMsg));
      }
    } catch (e, stackTrace) {
      print("❌ Exception in getReport: $e");
      print("Stack Trace: $stackTrace");
      callback(UiState.error("Error: $e"));
    }
  }
}