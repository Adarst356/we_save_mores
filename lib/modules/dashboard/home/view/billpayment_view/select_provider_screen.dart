import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/home/view/billpayment_view/bill_payment_screen.dart';
import 'package:we_save_more/modules/dashboard/home/view/billpayment_view/select_provider_controller.dart';
import 'package:we_save_more/theme/app_colors.dart';
import 'package:we_save_more/utils/constant.dart';

class SelectProviderScreen extends StatelessWidget {
  SelectProviderScreen({super.key});

  final controller = Get.put(ServiceProviderController());
  final RxString searchText = "".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      appBar: AppBar(
        backgroundColor: appColors.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Select Provider",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),

      body: Column(
        children: [
          searchBarUI(),

          Expanded(
            child: Obx(() {
              return controller.numberListState.value.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                none: () => const SizedBox(),
                error: (msg) => Center(child: Text(msg)),
                success: (data) {
                  final filteredList = controller.finalProviderList.where((op) {
                    if (searchText.value.isEmpty) return true;
                    if (op.isHeader == true) return true;
                    return (op.name ?? "").toLowerCase().contains(
                      searchText.value.toLowerCase(),
                    );
                  }).toList();

                  return ListView.builder(
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      final service = filteredList[index];

                      if (service.isHeader == true) {
                        return headerTile(service.header ?? "");
                      } else {
                        return providerTile(
                          service.image ?? "",
                          service.name ?? "",
                          service.serviceID ?? 0,
                          service.oid ?? 0,

                        );
                      }
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

  // -----------------------------------------------------
  // 🔍 SEARCH BAR
  // -----------------------------------------------------
  Widget searchBarUI() {
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
                onChanged: (value) => searchText.value = value,
                decoration: const InputDecoration(
                  hintText: 'Search provider',
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            ),

            Obx(
                  () => searchText.value.isNotEmpty
                  ? GestureDetector(
                onTap: () => searchText.value = "",
                child: const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.clear, size: 20, color: Colors.grey),
                ),
              )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  // -----------------------------------------------------
  // 🟦 HEADER TILE (Local State / Other State)
  // -----------------------------------------------------
  Widget headerTile(String title) {
    return Container(
      width: double.infinity,
      color: appColors.primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // -----------------------------------------------------
  // 🟡 PROVIDER TILE - UPDATED LOGIC
  // -----------------------------------------------------
  Widget providerTile(String image, String title, int serviceId,int oid) {
    return GestureDetector(
      onTap: () {
        // Check if this was opened from navigation or from bill payment screen
        bool isPrepaid = controller.serviceName.toLowerCase().contains('prepaid');
        bool isDTH = controller.serviceName.toLowerCase().contains('dth');

        if (isPrepaid || isDTH) {
          // Return data to BillPaymentScreen (for operator selection)
          Get.back(result: {
            "providerId": serviceId,
            "providerName": title,
            "providerImage": image,
            "oid":oid,
          });
        } else {
          // For other services: Navigate to BillPaymentScreen with provider data
          Get.off(
                () => BillPaymentScreen(),
            arguments: {
              "serviceId": controller.serviceId,
              "serviceName": controller.serviceName,
              "providerId": serviceId,
              "providerName": title,
              "providerImage": image,

            },
          );
        }
      },
      child: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey.shade200,
                  child: ClipOval(
                    child: Image.network(
                      "$baseIconUrl$image",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        );
                      },
                      errorBuilder: (_, __, ___) {
                        return Image.asset(
                          "assets/images/app_full_logo.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        );
                      },
                    )

                  ),
                ),

                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: appColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(height: 1.6, color: Colors.amber),
        ],
      ),
    );
  }
}