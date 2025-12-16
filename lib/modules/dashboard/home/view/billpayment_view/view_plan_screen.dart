import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/home/view/billpayment_view/view_plan_controller.dart';
import 'package:we_save_more/theme/app_colors.dart';
import '../../../../../utils/custom_appbar.dart';
import '../../data/simple_plan_response.dart';

class ViewPlanScreen extends StatelessWidget {
  ViewPlanScreen({super.key});

  final ViewPlanController controller = Get.put(ViewPlanController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppbar(
        title: "Plans",
        showLeft: true,
        leftIcon: GestureDetector(
          onTap: Get.back,
          child: Icon(Icons.arrow_back, color: theme.colorScheme.onPrimary),
        ),
      ),
      body: Column(
        children: [
          // ---------------- Tabs ----------------
          Container(
            color: Colors.white,
            height: 48,
            child: Obx(() {
              if (controller.allTypes.isEmpty) {
                // Loading indicator for tabs
                return const Center(
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              }

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: controller.allTypes.map((type) {
                    final tabName = type.pType?.toUpperCase() ?? '';
                    return _buildTab(
                      tabName,
                      controller.selectedTab.value == tabName,
                          () => controller.filterPlansByTab(tabName),
                    );
                  }).toList(),
                ),
              );
            }),
          ),

          // ---------------- Search ----------------
          Container(
            color: appColors.primaryColor,
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 42,
              child: TextField(
                onChanged: (value) {
                  controller.searchQuery.value = value.trim();
                },
                decoration: InputDecoration(
                  hintText: 'Search Plans',
                  prefixIcon:
                  const Icon(Icons.search, size: 20, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[100],
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),

          // ---------------- Plan List ----------------
          Expanded(
            child: Obx(() {
              return controller.viewPlanState.value.when(
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (msg) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline,
                          size: 48, color: Colors.red[300]),
                      const SizedBox(height: 16),
                      Text(
                        msg,
                        style: TextStyle(color: Colors.grey[600]),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: controller.fetchViewPlan,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
                success: (data) {
                  if (controller.filteredPlans.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.inbox_outlined,
                              size: 48, color: Colors.grey[400]),
                          const SizedBox(height: 16),
                          Text(
                            'No plans available',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  // Optional: apply search filter
                  final searchResults = controller.filteredPlans.where(
                        (plan) => plan.desc
                        ?.toLowerCase()
                        .contains(controller.searchQuery.value.toLowerCase()) ??
                        false,
                  ).toList();

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      final plan = searchResults[index];
                      return _buildPlanCard(plan);
                    },
                  );
                },
                none: () => const SizedBox.shrink(),
              );
            }),
          ),
        ],
      ),
    );
  }

  // ---------------- Tab Widget ----------------
  Widget _buildTab(String title, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color:
              isSelected ? const Color(0xFF6B3FA0) : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected ? const Color(0xFF6B3FA0) : Colors.grey[600],
          ),
        ),
      ),
    );
  }

  // ---------------- Plan Card Widget ----------------
  Widget _buildPlanCard(PDetails plan) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF6B3FA0), width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          /// LEFT
          Container(
            width: 90,
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFFF5F0FA),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                bottomLeft: Radius.circular(6),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "₹ ${plan.rs ?? '0'}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Validity",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  plan.validity ?? "",
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          /// RIGHT
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                plan.desc ?? "No description available",
                style: const TextStyle(fontSize: 11, height: 1.4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
