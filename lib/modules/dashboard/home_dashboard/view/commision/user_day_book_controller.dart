import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../../api/ui_state.dart';
import '../../data/user_day_book_repo.dart';
import '../../data/user_day_book_response.dart';


class UserDayBookController extends GetxController {
  final UserDayBookRepo repo = UserDayBookRepo();
  final box = GetStorage();

  final userDayBookState = Rx<UiState<UserDayBookResponse>>(UiState.none());

  @override
  void onInit() {
    super.onInit();
    getUserDayBook();
  }

  Future<void> getUserDayBook({
    String? accountNo,
    String? fromDate,
    String? toDate,
  }) async {
    final now = DateTime.now();
    final defaultDate =
        "${now.day.toString().padLeft(2, '0')} ${_getMonthName(now.month)} ${now.year}";

    repo.getUserDayBook(
      body: {
        "accountNo": accountNo ?? box.read("accountNo")?.toString() ?? "",
        "fromDate": fromDate ?? defaultDate,
        "toDate": toDate ?? defaultDate,
        "IsB2C": false,
        // "appid": "6072874e1f4b7000991915fa914318ed",
        "imei": "",
        "loginTypeID": 1,
        "opType": 0,
        "regKey": "",
        "serialNo": "",
        // "session": box.read("session") ?? "",
        // "sessionID": box.read("sessionID") ?? "",
        // "userID": box.read("userID")?.toString() ?? "",
        "uid": 0,
        // "version": "5.0",
      },
      callback: (state) {
        userDayBookState.value = state;
      },
    );
  }

  String _getMonthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }

  Future<void> refreshDayBook({
    String? accountNo,
    String? fromDate,
    String? toDate,
  }) async {
    await getUserDayBook(
      accountNo: accountNo,
      fromDate: fromDate,
      toDate: toDate,
    );
  }
}
