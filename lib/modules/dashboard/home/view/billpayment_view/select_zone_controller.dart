import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../api/ui_state.dart';
import '../../data/billpayment_response.dart';
import '../../data/getop_type_response.dart';

class SelectZoneController extends GetxController {
  final GetStorage box = GetStorage();

  /// original full list
  List<Cirlces> allCircles = [];
  List<NumSeries> numberSeries = [];

  /// filtered list for UI
  RxList<Cirlces> circleList = <Cirlces>[].obs;
  RxList<NumSeries> numberSeriesList = <NumSeries>[].obs;

  /// search text
  RxString searchText = ''.obs;

  @override
  void onInit() {
    loadCircles();

    /// search listener
    ever(searchText, (_) => filterCircles());

    super.onInit();
  }

  void loadCircles() {
    final json = box.read("number_list_response");

    if (json != null) {
      final response = GetNumberList.fromJson(json);
      allCircles = response.data?.cirlces ?? [];
      numberSeries = response.data?.numSeries??[];
      /// initially full list
      numberSeriesList.assignAll(numberSeries);
      circleList.assignAll(allCircles);
    }
  }

  void filterCircles() {
    final query = searchText.value.toLowerCase();

    if (query.isEmpty) {
      circleList.assignAll(allCircles);
    } else {
      circleList.assignAll(
        allCircles.where((c) => (c.circle ?? '').toLowerCase().contains(query)),
      );
    }
  }

  void clearSearch() {
    searchText.value = '';
    circleList.assignAll(allCircles);
  }
}
