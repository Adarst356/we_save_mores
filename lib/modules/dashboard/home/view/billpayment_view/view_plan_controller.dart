import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/home/data/simple_plan_response.dart';
import '../../../../../api/ui_state.dart';
import '../../data/simple_plan_repo.dart';

class ViewPlanController extends GetxController {
  final SimplePlanRepo repo = SimplePlanRepo();

  final allTypes = <Types>[].obs;
  final filteredPlans = <PDetails>[].obs;
  final selectedTab = 'UNLIMITED'.obs;
  final viewPlanState = Rx<UiState<GetSimpleRechPlan>>(UiState.none());

  final searchQuery = ''.obs;
  late final String circleID;
  late final String oid;
  @override
  void onInit() {
    super.onInit();
// Read arguments from Get.to()
    final args = Get.arguments;
    circleID = args?['circleID']?.toString() ?? '';
    oid = args?['oid']?.toString() ?? '';

    ever(searchQuery, (_) => _applyFilters());

    fetchViewPlan();
  }

  // ---------------- Filter plans by tab ----------------
  void filterPlansByTab(String tab) {
    selectedTab.value = tab;
    _applyFilters();
  }

  // ---------------- Apply tab + search filters ----------------
  void _applyFilters() {
    final type = allTypes.firstWhereOrNull(
          (e) => e.pType?.toUpperCase() == selectedTab.value.toUpperCase(),
    );

    if (type != null && type.pDetails != null) {
      final plans = type.pDetails!;
      final query = searchQuery.value.toLowerCase();

      if (query.isNotEmpty) {
        filteredPlans.value = plans.where((plan) {
          // final desc = plan.desc?.toLowerCase() ?? '';
          final amount = plan.rs?.toString() ?? '';
          final validity = plan.validity?.toLowerCase() ?? '';

          return amount.contains(query) ||
              amount.contains(query) ||
              validity.contains(query);
        }).toList();
      } else {
        filteredPlans.value = plans;
      }
    } else {
      filteredPlans.clear();
    }
  }



  // ---------------- Fetch API ----------------
  void fetchViewPlan() {
    repo.getSimplePlanData(
      body: {
    "circleID": circleID,
    "oid": oid,
    },
      callback: (state) {
        state.when(
            success: (data) {
              print('API Response data: ${data.data}');
              viewPlanState.value = UiState.success(data);
              if (data.data?.types != null) {
                allTypes.value = data.data!.types!;
                _applyFilters();
              }
            },
          error: (msg) {
            viewPlanState.value = UiState.error(msg);
          },
          loading: () {
            viewPlanState.value = UiState.loading();
          },
          none: () {
            viewPlanState.value = UiState.none();
          },
        );
      },
    );
  }

  void clearSearch() {
    searchQuery.value = '';
  }
}
