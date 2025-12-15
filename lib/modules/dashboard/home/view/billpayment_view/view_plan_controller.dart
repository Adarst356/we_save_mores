import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/home/data/simple_plan_response.dart';
import '../../../../../api/ui_state.dart';
import '../../data/simple_plan_repo.dart';

class ViewPlanController extends GetxController {
  final SimplePlanRepo repo = SimplePlanRepo();

  final allTypes = <Types>[].obs;
  final filteredPlans = <PDetails>[].obs;
  final selectedTab = 'Unlimited'.obs;
  final searchQuery = ''.obs;
  final viewPlanState = Rx<UiState<GetSimpleRechPlan>>(UiState.none());

  @override
  void onInit() {
    super.onInit();
    fetchViewPlan();
  }

  void fetchViewPlan() {
    viewPlanState.value = UiState.loading();

    repo.getSimplePlanData(
      body: {},
      callback: (state) {
        viewPlanState.value = state;

        state.when(
          success: (data) {
            if (data.data?.types != null) {
              allTypes.assignAll(data.data!.types!);

              // Log available plan types
              print("📋 Available plan types from API:");
              for (var type in allTypes) {
                print("   - '${type.pType}' (${type.pDetails?.length ?? 0} plans)");
              }

              filterPlansByTab(selectedTab.value);
            }
          },
          loading: () {},
          error: (msg) {
            print("❌ Error: $msg");
          },
          none: () {},
        );
      },
    );
  }

  void filterPlansByTab(String tab) {
    selectedTab.value = tab;
    searchQuery.value = ''; // Reset search when changing tabs

    // Find exact match with the pType from API
    final type = allTypes.firstWhereOrNull(
          (e) => e.pType == tab,
    );

    if (type != null && type.pDetails != null) {
      filteredPlans.assignAll(type.pDetails!);
      print("✅ Found ${filteredPlans.length} plans for '$tab'");
    } else {
      filteredPlans.clear();
      print("⚠️ No plans found for tab: '$tab'");
      print("   Available types: ${allTypes.map((e) => e.pType).join(', ')}");
    }
  }

  void searchPlans(String query) {
    searchQuery.value = query;

    if (query.isEmpty) {
      // If search is empty, show all plans for selected tab
      filterPlansByTab(selectedTab.value);
      return;
    }

    // Find the current tab's type
    final type = allTypes.firstWhereOrNull((e) => e.pType == selectedTab.value);

    if (type != null && type.pDetails != null) {
      // Filter plans based on search query
      final searchLower = query.toLowerCase();
      filteredPlans.assignAll(
        type.pDetails!.where((plan) {
          final rs = plan.rs?.toLowerCase() ?? '';
          final desc = plan.desc?.toLowerCase() ?? '';
          final validity = plan.validity?.toLowerCase() ?? '';

          return rs.contains(searchLower) ||
              desc.contains(searchLower) ||
              validity.contains(searchLower);
        }).toList(),
      );

      print("🔍 Search '$query': Found ${filteredPlans.length} plans");
    }
  }
}