import 'package:get/get.dart';

import '../../../../../api/ui_state.dart';
import '../../data/redeem_card_repo.dart';
import '../../data/redeem_card_response.dart';

class RedeemCardController extends GetxController {
  final RedeemCardRepo repo = RedeemCardRepo();
  RxBool isLoading = false.obs;

  final redeemCardState = Rx<UiState<RedeemCouponListResponse>>(UiState.none());

  @override
  void onInit() {
    super.onInit();
    getRedeemCardList();
  }

  /// Fetch Redeem Card List
  void getRedeemCardList() {
    isLoading.value = true;

    repo.getRedeemCardList(
      body: {},
      callback: (state) {
        state.when(
          success: (data) {
            redeemCardState.value = UiState.success(data);
            print("Redeem Card API SUCCESS");
            print("Status Code: ${data.statuscode}");
            print("Message: ${data.msg}");
            isLoading.value = false;
          },
          error: (msg) {
            redeemCardState.value = UiState.error(msg);
            print("Redeem Card ERROR: $msg");
            isLoading.value = false;
          },
          loading: () {
            redeemCardState.value = UiState.loading();
            print("Redeem Card Loading...");
            isLoading.value = true;
          },
          none: () {
            redeemCardState.value = UiState.none();
            print("Redeem Card None State");
          },
        );
      },
    );
  }

  /// Refresh API
  void refreshRedeemCardList() {
    getRedeemCardList();
  }
}
