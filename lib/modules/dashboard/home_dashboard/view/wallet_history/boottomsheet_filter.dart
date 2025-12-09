import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MiniFilterBottomSheet extends StatelessWidget {
  final Function(Map<String, String>) onFilterApplied;

  MiniFilterBottomSheet({super.key, required this.onFilterApplied});

  final fromDate = TextEditingController();
  final toDate = TextEditingController();
  final mobile = TextEditingController();
  final transaction = TextEditingController();

  final RxString selectedTop = "All".obs;

  final topOptions = ["All", "10", "20", "50", "100"];

  static void show(BuildContext context, Function(Map<String, String>) apply) {
    showModalBottomSheet(
      context: context,
      builder: (_) => MiniFilterBottomSheet(onFilterApplied: apply),
      isScrollControlled: true,
    );
  }

  String getTopValue() => selectedTop.value == "All" ? "50" : selectedTop.value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Filter Ledger",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: customField("From Date", fromDate,
                      icon: Icons.calendar_today, pick: true, context: context),
                ),
                const SizedBox(width: 12),

                Expanded(
                  child: customField("To Date", toDate,
                      icon: Icons.calendar_today, pick: true, context: context),
                ),
                const SizedBox(width: 12),

                Expanded(
                  child: Obx(() => DropdownButtonFormField(
                    value: selectedTop.value,
                    decoration: const InputDecoration(
                      labelText: "Top",
                      border: OutlineInputBorder(),
                    ),
                    items: topOptions
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (v) => selectedTop.value = v!,
                  )),
                ),
              ],
            ),


            SizedBox(height: 16),

            customField("Child Mobile", mobile, icon: Icons.phone),

            const SizedBox(height: 16),

            customField("Transaction ID", transaction, icon: Icons.receipt),

            const SizedBox(height: 16),

            const Text("Choose Top"),

            Obx(() => DropdownButtonFormField(
              value: selectedTop.value,
              items: topOptions
                  .map((e) =>
                  DropdownMenuItem(value: e, child: Text("$e Rows")))
                  .toList(),
              onChanged: (v) => selectedTop.value = v!,
            )),

            const SizedBox(height: 22),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  onFilterApplied({
                    "fromDate": fromDate.text.isEmpty
                        ? "01-Jan-2024"
                        : fromDate.text,
                    "toDate": toDate.text.isEmpty
                        ? "31-Dec-2025"
                        : toDate.text,
                    "mobile": mobile.text,
                    "transaction": transaction.text,
                    "top": getTopValue(),
                  });

                  Get.back();
                },
                child: const Text(
                  "Apply Filter",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customField(
      String label,
      TextEditingController controller, {
        IconData? icon,
        bool pick = false,
        BuildContext? context,
      }) {
    return TextField(
      controller: controller,
      readOnly: pick,
      onTap: pick
          ? () async {
        DateTime? d = await showDatePicker(
          context: context!,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2035),
        );
        if (d != null) {
          controller.text = "${d.day}-${_m(d.month)}-${d.year}";
        }
      }
          : null,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon != null ? Icon(icon) : null,
        border: OutlineInputBorder(),
      ),
    );
  }

  String _m(int m) {
    const l = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    return l[m - 1];
  }
}
