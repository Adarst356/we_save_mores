import 'package:we_save_more/modules/dashboard/profile/data/profile_response.dart';

import '../../../../../../api/api_client.dart';
import '../../../../../../api/ui_state.dart';



class  ProfileRepo{
  final GetConnectApiClient _apiClient = GetConnectApiClient.instance;
  Future<void> getProfileData({
    required Map<String, dynamic> body,
    required Function(UiState<ProfileResponse> state) callback,
  }) async {
    callback(UiState.loading());

    try {
      final res = await _apiClient.getProfile(body);

      if (res.status.isOk) {
        final data = ProfileResponse.fromJson(res.body);
        callback(UiState.success(data));
      } else {
        callback(UiState.error("Failed to fetch referral data"));
      }
    } catch (e) {
      callback(UiState.error("Error: $e"));
    }
  }
}
