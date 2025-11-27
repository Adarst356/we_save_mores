import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterBottomSheet extends StatelessWidget {
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController accountController = TextEditingController();
  final TextEditingController transactionController = TextEditingController();

  final RxString selectedTop = 'All'.obs;
  final RxString selectedStatus = 'All'.obs;

  final List<String> topOptions = ['All', '10', '20', '50', '100'];
  final List<String> statusOptions = ['All', 'Success', 'Pending', 'Failed'];

  FilterBottomSheet({super.key});

  /// ---------- STATIC METHOD (Fixed) ----------
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => FilterBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: const Center(
              child: Text(
                "Filter by",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  ///----------------- DATE RANGE -----------------
                  Row(
                    children: [
                      Expanded(child: _datePickerField("From Date", fromDateController, context)),
                      const SizedBox(width: 12),
                      Expanded(child: _datePickerField("To Date", toDateController, context)),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // ---------------- MOBILE NUMBER ----------------
                  _inputBox(
                    "Child Mobile Number",
                    mobileController,
                    Icons.phone_android,
                    TextInputType.phone,
                  ),
                  const SizedBox(height: 16),

                  // ---------------- ACCOUNT NUMBER ----------------
                  _inputBox(
                    "Account Number/Recharge Number",
                    accountController,
                    Icons.account_balance,
                    TextInputType.number,
                  ),
                  const SizedBox(height: 16),

                  // ---------------- TRANSACTION ID ----------------
                  _inputBox(
                    "Transaction Id",
                    transactionController,
                    Icons.receipt_long,
                    TextInputType.text,
                  ),
                  const SizedBox(height: 16),

                  // ---------------- TOP ----------------
                  const Text(
                    "Choose Top",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),

                  Obx(() => DropdownButtonFormField<String>(
                    value: selectedTop.value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                    items: topOptions
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) => selectedTop.value = value!,
                  )),
                  const SizedBox(height: 16),

                  /// ---------------- STATUS ----------------
                  const Text(
                    "Choose Status",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),

                  Obx(() => DropdownButtonFormField<String>(
                    value: selectedStatus.value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                    items: statusOptions
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) => selectedStatus.value = value!,
                  )),

                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Get.back(result: {
                          "fromDate": fromDateController.text,
                          "toDate": toDateController.text,
                          "mobile": mobileController.text,
                          "account": accountController.text,
                          "transaction": transactionController.text,
                          "top": selectedTop.value,
                          "status": selectedStatus.value,
                        });
                      },
                      child: const Text(
                        "Filter",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// ---------------- HELPER WIDGETS ----------------

  Widget _datePickerField(String title, TextEditingController controller, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          readOnly: true,
          decoration: InputDecoration(
            hintText: "Select Date",
            prefixIcon: const Icon(Icons.calendar_today),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onTap: () async {
            DateTime? date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime(2035),
            );
            if (date != null) {
              controller.text = "${date.day}-${_monthName(date.month)}-${date.year}";
            }
          },
        ),
      ],
    );
  }

  Widget _inputBox(String title, TextEditingController ctrl, IconData icon, TextInputType type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextField(
          controller: ctrl,
          keyboardType: type,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            hintText: title,
          ),
        )
      ],
    );
  }

  String _monthName(int m) {
    const mList = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
    return mList[m - 1];
  }
}
