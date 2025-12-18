import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/home/data/getRn_offer_response.dart';
import '../../../../../api/ui_state.dart';
import '../../data/getRn_offer_repo.dart';

class ROfferController extends GetxController {
  final GetRnOfferRepo repo = GetRnOfferRepo();
  final rOfferState = Rx<UiState<GetRNPRofferResponse>>(UiState.none());

  // Observable list for dynamic data
  final offerList = <Map<String, dynamic>>[].obs;

  late String accountNo;
  late int oid;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    accountNo = args["accountNo"] ?? "";
    oid = args["oid"] ?? 0;

    // Fetch R Offer data from API
    getROfferData();
  }

  void getROfferData() {
    rOfferState.value = UiState.loading();

    repo.getPlanRofferData(
      body: {
        "accountNo": accountNo,
        "oid": oid.toString(),
      },
      callback: (state) {
        state.when(
          success: (data) {
            offerList.clear();

            if (data.rofferData != null) {
              offerList.addAll(
                data.rofferData!.map((e) => {
                  "amount": e.amount ?? "",
                  "description": e.description ?? "",
                }),
              );
            }

            rOfferState.value = UiState.success(data);
          },

          loading: () {
            rOfferState.value = UiState.loading();
          },

          error: (msg) {
            rOfferState.value = UiState.error(msg);
          },

          none: () {
            rOfferState.value = UiState.none();
          },
        );
      },
    );
  }

}