import 'package:get/get.dart';
import '../../../../../api/ui_state.dart';
import '../../data/banner_repo.dart';
import '../../data/banner_response.dart';

class BannerController extends GetxController {
  final BannerRepo repo = BannerRepo();

  final bannerState = Rx<UiState<GetBannerResponse>>(UiState.none());

  @override
  void onInit() {
    super.onInit();
    getBanner();
  }

  getBanner() {
    repo.getBannerData(
      body: {
        "IsB2C": false,
        "loginTypeID": 0,
        "opType": 1,
        "uid": 0,
      },
      callback: (state) {
        state.when(
          loading: () {
            bannerState.value = UiState.loading();
            print(" Banner Loading...");
          },

          success: (data) {
            bannerState.value = UiState.success(data);
            print(" Banner API SUCCESS");
            print("Status Code: ${data.statuscode}");
            print(" Message: ${data.msg}");
            print(" Total Banners: ${data.bannerUrl?.length}");

          },

          error: (msg) {
            bannerState.value = UiState.error(msg);
            print(" Banner Error: $msg");
          },

          none: () {
            bannerState.value = UiState.none();
            print(" Banner None State");
          },
        );
      },
    );
  }
}
