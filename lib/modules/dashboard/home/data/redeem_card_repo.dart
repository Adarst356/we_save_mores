import 'package:we_save_more/modules/dashboard/home/data/redeem_card_response.dart';
import '../../../../../../api/api_client.dart';
import '../../../../../../api/ui_state.dart';

class RedeemCardRepo {
  final GetConnectApiClient _apiClient = GetConnectApiClient.instance;

  Future<void> getRedeemCardList({
    required Map<String, dynamic> body,
    required Function(UiState<RedeemCouponListResponse> state) callback,
  }) async {
    callback(UiState.loading());

    try {
      final res = await _apiClient.getRedeemCouponList(body);

      if (res.status.isOk) {
        final data = RedeemCouponListResponse.fromJson(res.body);
        callback(UiState.success(data));
      } else {
        callback(UiState.error("Failed to fetch Redeem Card data"));
      }
    } catch (e) {
      callback(UiState.error("Error: $e"));
    }
  }
}