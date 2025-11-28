import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterBottomSheet extends StatelessWidget {
  final Function(Map<String, String>) onFilterApplied;

  FilterBottomSheet({super.key, required this.onFilterApplied});

  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController accountController = TextEditingController();
  final TextEditingController transactionController = TextEditingController();

  final RxString selectedTop = 'All'.obs;
  final RxString selectedStatus = 'All'.obs;

  final List<String> topOptions = ['All', '10', '20', '50', '100'];
  final List<String> statusOptions = ['All', 'Success', 'Pending', 'Failed', 'Refund'];

  /// ---------- STATIC METHOD ----------
  static void show(BuildContext context, {required Function(Map<String, String>) onFilterApplied}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => FilterBottomSheet(onFilterApplied: onFilterApplied),
    );
  }

  /// Convert status to API format
  String getStatusValue() {
    switch (selectedStatus.value) {
      case 'Success':
        return '2';
      case 'Pending':
        return '1';
      case 'Failed':
        return '3';
      case 'Refund':
        return '4';
      default:
        return '0'; // All
    }
  }

  /// Convert Top to API format
  String getTopValue() {
    return selectedTop.value == 'All' ? '50' : selectedTop.value;
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
                  /// ----------------- DATE RANGE -----------------
                  Row(
                    children: [
                      Expanded(
                        child: customFormField(
                          label: "From Date",
                          controller: fromDateController,
                          readOnly: true,
                          icon: Icons.calendar_today,
                          onTap: () => pickDate(context, fromDateController),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: customFormField(
                          label: "To Date",
                          controller: toDateController,
                          readOnly: true,
                          icon: Icons.calendar_today,
                          onTap: () => pickDate(context, toDateController),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  /// ---------------- MOBILE NUMBER ----------------
                  customFormField(
                    label: "Child Mobile Number",
                    controller: mobileController,
                    keyboardType: TextInputType.phone,
                    icon: Icons.phone_android,
                  ),
                  const SizedBox(height: 16),

                  /// ---------------- ACCOUNT ----------------
                  customFormField(
                    label: "Account Number/Recharge Number",
                    controller: accountController,
                    keyboardType: TextInputType.number,
                    icon: Icons.account_balance,
                  ),
                  const SizedBox(height: 16),

                  /// ---------------- TRANSACTION ----------------
                  customFormField(
                    label: "Transaction Id",
                    controller: transactionController,
                    keyboardType: TextInputType.text,
                    icon: Icons.receipt_long,
                  ),
                  const SizedBox(height: 16),

                  /// ---------------- TOP ----------------
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

                  /// FILTER BUTTON
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
                        final filterData = {
                          "fromDate": fromDateController.text.isEmpty
                              ? "01-Jan-2024"
                              : fromDateController.text,
                          "toDate": toDateController.text.isEmpty
                              ? "31-Dec-2025"
                              : toDateController.text,
                          "mobile": mobileController.text,
                          "account": accountController.text,
                          "transaction": transactionController.text,
                          "top": getTopValue(),
                          "status": getStatusValue(),
                        };

                        Get.back();
                        onFilterApplied(filterData);
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

  /// ------------------- GENERIC HELPER FIELD -------------------

  final Color primaryColor = const Color(0xFF3E1F66);

  Widget customFormField({
    required String label,
    required TextEditingController controller,
    IconData? icon,
    TextInputType? keyboardType,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          readOnly: readOnly,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: label,
            prefixIcon: icon != null ? Icon(icon, color: primaryColor) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onTap: onTap,
        ),
      ],
    );
  }

  /// ------------------- DATE PICKER -------------------

  Future<void> pickDate(BuildContext context, TextEditingController controller) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );

    if (date != null) {
      controller.text = "${date.day}-${_monthName(date.month)}-${date.year}";
    }
  }

  String _monthName(int m) {
    const mList = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    return mList[m - 1];
  }
}