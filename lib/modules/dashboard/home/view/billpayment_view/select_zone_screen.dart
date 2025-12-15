import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:we_save_more/modules/dashboard/home/view/billpayment_view/select_zone_controller.dart';
import 'package:we_save_more/modules/dashboard/home/view/billpayment_view/view_plan_screen.dart';

import '../../../../../utils/custom_appbar.dart';

class SelectZoneScreen extends StatelessWidget {
  SelectZoneScreen({super.key});

  final SelectZoneController controller =
  Get.put(SelectZoneController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppbar(
        title: "Select Zone",
        showLeft: true,
        leftIcon: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back,
              color: theme.colorScheme.onPrimary),
        ),
      ),

      body: Column(
        children: [
          searchBarUI(controller),

          Expanded(
            child: Obx(() {
              if (controller.circleList.isEmpty) {
                return const Center(child: Text("No zones found"));
              }
              return ListView.separated(
                itemCount: controller.circleList.length,
                separatorBuilder: (_, __) => const Divider(
                  height: 1,
                  thickness: 0.6,
                ),
                itemBuilder: (context, index) {
                  final circle = controller.circleList[index];

                  return ListTile(
                    title: Text(
                      circle.circle ?? "",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                    onTap: () {
                      Get.to(() => const ViewPlanScreen(), arguments: {
                        "zone": circle,
                      });
                    },
                  );
                },
              );

            }),
          ),
        ],
      ),
    );
  }
}
Widget searchBarUI(SelectZoneController controller) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
    child: Container(
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          const Icon(Icons.search, size: 22, color: Colors.grey),
          const SizedBox(width: 8),

          Expanded(
            child: TextField(
              onChanged: (value) => controller.searchText.value = value,
              decoration: const InputDecoration(
                hintText: 'Search zone',
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),

          /// ❌ Clear icon
          Obx(
                () => controller.searchText.value.isNotEmpty
                ? GestureDetector(
              onTap: controller.clearSearch,
              child: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.clear,
                    size: 20, color: Colors.grey),
              ),
            )
                : const SizedBox(),
          ),
        ],
      ),
    ),
  );
}


