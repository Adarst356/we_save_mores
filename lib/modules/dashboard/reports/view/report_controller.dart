import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {

  final TextEditingController searchController = TextEditingController();

  RxString searchText = ''.obs;

  @override
  void onInit() {
    searchController.addListener(() {
      searchText.value = searchController.text.trim();
    });
    super.onInit();
  }


  void onSearchChanged(String query) {
    // ---- API CALL HERE ----
    // fetchReportData(query);
    print("Searching: $query");
  }

  // Clear search
  void clearSearch() {
    searchController.clear();
    searchText.value = "";
    onSearchChanged("");
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
