import 'package:get/get.dart';

import '../../../../api/ui_state.dart';
import '../data/support_repo.dart';
import '../data/support_response.dart';

class SupportController extends GetxController{
  static SupportController to = Get.find();
  final SupportRepo repo = SupportRepo();
  RxBool isLoading = true.obs;

  final supportState = Rx<UiState<CompanyProfileResponse>>(UiState.none());


  /// API DATA VARIABLES
  Rx<CompanyProfileResponse?> supportData = Rx<CompanyProfileResponse?>(null);

  /// Helper getters for null handling
  bool get hasCustomerCarePhone =>
      (supportData.value?.customerPhoneNos ?? "").toString().trim().isNotEmpty;

  bool get hasCustomerCareEmail =>
      (supportData.value?.customerCareEmailIds ?? "").toString().trim().isNotEmpty;

  bool get hasWhatsapp =>
      (supportData.value?.customerWhatsAppNos ?? "").toString().trim().isNotEmpty;

  bool get hasAddress =>
      (supportData.value?.address ?? "").toString().trim().isNotEmpty;

  void getSupport() {
    isLoading.value = true;

    repo.getCompanyProfile(
      body: {},
      callback: (state) {
        supportState.value = state;

        state.when(
          success: (data) {
            supportData.value = data;
          },
          error: (msg) {
            print("Support API Error: $msg");
          },
          loading: () {},
          none: () {},
        );

        isLoading.value = false;
      },
    );
  }

  @override
  void onInit() {
    getSupport();
    super.onInit();
  }

}