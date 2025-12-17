import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/home/data/getRn_offer_response.dart';
import '../../../../../api/ui_state.dart';
import '../../data/getRn_offer_repo.dart';

class ROfferController extends  GetxController{
  final offerList = <Map<String, dynamic>>[
    {
      "amount": "22",
      "description": "Data : 1GB | Validity : 1 day",
    },
    {
      "amount": "49",
      "description":
      "Data : Unlimited | Details : Better choice over Rs. 22. Rs. 26 & Rs. 33 pack",
    },
    {
      "amount": "100",
      "description":
      "Data : 6GB | Details : Airtel Xstream Play subscription for 30 days, Better choice over Rs. 49 & Rs. 77 pack",
    },
    {
      "amount": "199",
      "description":
      "Calls : Unlimited | Data : 2GB | SMS : 100/day | Validity : 28 days",
    },
    {
      "amount": "279",
      "description":
      "Data : 1GB/day | Validity : 1 Month | Details : Netflix Basic, Zee5 Premium, Xstream Play Premium & JioHotstar Super",
    },
    {
      "amount": "299",
      "description":
      "Calls : Unlimited | Data : 1.5GB/day | SMS : 100/day | Validity : 28 days | Rs. 299 pack is the smarter choice over Rs. 249",
    },
    {
      "amount": "349",
      "description":
      "Calls : Unlimited | Data : Unlimited 5G + 2GB/day | SMS : 100/day | Validity : 28 days | Added benefit : Apple Music up to 6 months, Airtel Xstream Play Premium for 28 days (free 20+ OTTs)",
    },
    {
      "amount": "489",
      "description":
      "Calls : Unlimited | Data : 6GB | SMS : 600 | Validity : 77 days",
    },
  ].obs;
  final GetRnOfferRepo repo = GetRnOfferRepo();
  final rOfferState = Rx<UiState<GetRNPRofferResponse>>(UiState.none());
  late String accountNo;
  late int oid;

  @override
  void onInit() {
    final args = Get.arguments;
    accountNo = args["accountNo"];
    oid = args["oid"];
    getROfferData();
    super.onInit();
  }
  getROfferData() {
    repo.getPlanRofferData(
      body: {
        "accountNo":accountNo,
        "oid":oid.toString()
      },
      callback: (state) {
        rOfferState.value = state;
        state.when(
          success: (data) => rOfferState.value = UiState.success(data),
          loading: () => rOfferState.value = UiState.loading(),
          error: (msg) => rOfferState.value = UiState.error(msg),
          none: () => rOfferState.value = UiState.none(),
        );
      },
    );
  }
}