import 'package:we_save_more/modules/dashboard/reports/data/user_day_book_response.dart';
import '../../../../../../api/api_client.dart';
import '../../../../../../api/ui_state.dart';

class UserDayBookRepo {
  final GetConnectApiClient _apiClient = GetConnectApiClient.instance;

  Future<void> getUserDayBook({
    required Map<String, dynamic> body,
    required Function(UiState<UserDayBookResponse> state) callback,
  }) async {
    callback(UiState.loading());

    try {
      final res = await _apiClient.getUserDayBook(body);

      if (res.status.isOk) {
        final data = UserDayBookResponse.fromJson(res.body);
        callback(UiState.success(data));
      } else {
        callback(UiState.error("Failed to fetch User Day Book data"));
      }
    } catch (e) {
      callback(UiState.error("Error: $e"));
    }
  }
}