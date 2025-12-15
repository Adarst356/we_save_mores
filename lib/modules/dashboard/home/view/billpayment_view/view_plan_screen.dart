import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/home/view/billpayment_view/view_plan_controller.dart';
import 'package:we_save_more/theme/app_colors.dart';
import '../../../../../utils/custom_appbar.dart';
import '../../data/simple_plan_response.dart';

class ViewPlanScreen extends StatelessWidget {
  const ViewPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final zone = Get.arguments?["zone"];
    final theme = Theme.of(context);
    final controller = Get.put(ViewPlanController());

    return Scaffold(
      appBar: CustomAppbar(
        title: "Plans",
        showLeft: true,
        leftIcon: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: theme.colorScheme.onPrimary),
        ),
      ),
      body: Column(
        children: [
          // Tab Bar - FIXED: Match exact API pType values
          Container(
            color: Colors.white,
            height: 48,
            child: Obx(
                  () => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildTab('Unlimited', controller.selectedTab.value == 'Unlimited',
                            () => controller.filterPlansByTab('Unlimited')),
                    _buildTab('Data', controller.selectedTab.value == 'Data',
                            () => controller.filterPlansByTab('Data')),
                    _buildTab('Talktime Plans', controller.selectedTab.value == 'Talktime Plans',
                            () => controller.filterPlansByTab('Talktime Plans')),
                    _buildTab('International', controller.selectedTab.value == 'International',
                            () => controller.filterPlansByTab('International')),
                    _buildTab('ISD', controller.selectedTab.value == 'ISD',
                            () => controller.filterPlansByTab('ISD')),
                    _buildTab('INFLIGHT ROAMING PACKS', controller.selectedTab.value == 'INFLIGHT ROAMING PACKS',
                            () => controller.filterPlansByTab('INFLIGHT ROAMING PACKS')),
                  ],
                ),
              ),
            ),
          ),

          // Search Bar
          Container(
            color: appColors.primaryColor,
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) => controller.searchPlans(value),
              decoration: InputDecoration(
                hintText: 'Search plans...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),

          // Plans List with Loading/Error States
          Expanded(
            child: Obx(() {
              return controller.viewPlanState.value.when(
                success: (_) {
                  if (controller.filteredPlans.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.inbox_outlined, size: 64, color: Colors.grey[400]),
                          const SizedBox(height: 16),
                          Text(
                            'No plans available',
                            style: TextStyle(color: Colors.grey[600], fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: controller.filteredPlans.length,
                    itemBuilder: (context, index) {
                      final plan = controller.filteredPlans[index];
                      return _buildPlanCard(plan);
                    },
                  );
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                error: (message) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
                        const SizedBox(height: 16),
                        Text(
                          'Error loading plans',
                          style: TextStyle(color: Colors.grey[600], fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          message,
                          style: TextStyle(color: Colors.grey[500], fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => controller.fetchViewPlan(),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                },
                none: () {
                  return const Center(
                    child: Text('No data'),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? const Color(0xFF6B3FA0) : Colors.transparent,
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
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w800,
            color: isSelected ? const Color(0xFF6B3FA0) : Colors.grey[600],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCard(PDetails plan) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF6B3FA0), width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // LEFT
          Container(
            width: 90,
            padding: const EdgeInsets.all(12),
            color: const Color(0xFFF5F0FA),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "₹ ${plan.rs ?? '--'}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  plan.validity ?? "",
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
          ),
          // RIGHT
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                plan.desc ?? "",
                style: const TextStyle(fontSize: 11),
              ),
            ),
          ),
        ],
      ),
    );
  }
}