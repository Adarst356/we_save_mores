import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_save_more/modules/dashboard/profile/view/profile_controller.dart';
import 'package:we_save_more/routes/app_routes.dart';
import 'package:we_save_more/utils/spacing.dart';
import 'package:we_save_more/widget/app_text.dart';

import '../../drawer/view/side_drawer_controller.dart';
import 'balance_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());
    final BalanceController balanceController = Get.put(BalanceController());
    final SideDrawerController logoutController = Get.put(SideDrawerController());
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFF5E2CAB),
        title: const AppText(
          'User Profile',
          color: Colors.white,
          fontSize: 18,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.power_settings_new, color: Colors.white),
            onPressed: () {
              logoutController.showLogoutDialog();
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value &&
            controller.profileData.value == null) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFF5E2CAB),
            ),
          );
        }

        final profile = controller.profileData.value;
        final initials = controller.getInitials(profile?.name);

        return SingleChildScrollView(
          child: Column(
            children: [

              /// Profile Header Section
              Container(
                color: const Color(0xFF5E2CAB),
                padding: const EdgeInsets.only(bottom: 60),
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: const Color(0xFF1E88A8),
                          backgroundImage: profile?.profilePic != null &&
                              profile!
                                  .profilePic
                                  .toString()
                                  .isNotEmpty
                              ? NetworkImage(profile.profilePic.toString())
                              : null,
                          child: profile?.profilePic == null ||
                              profile!
                                  .profilePic
                                  .toString()
                                  .isEmpty
                              ? AppText(
                            initials,
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )
                              : null,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacing.h12,
                    AppText(
                      profile?.name ?? 'User Name',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    Spacing.h4,
                    AppText(
                      profile?.mobileNo ?? 'N/A',
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                    Spacing.h2,
                    AppText(
                      profile?.emailID ?? 'N/A',
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),

              /// Balance Card
              Transform.translate(
                offset: const Offset(0, -30),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // White background box
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white),
                        ),
                      ),

                      /// Main purple card
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFF5E2CAB),
                                const Color(0xFF7E3FBF),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(
                                      Icons.account_balance_wallet,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                  Spacing.w12,
                                  AppText(
                                    'Balance',
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              Spacing.h16,
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      const AppText(
                                        'PREPAID WALLET',
                                        fontSize: 12,
                                        color: Colors.white70,
                                        letterSpacing: 0.5,
                                      ),
                                      Spacing.h4,
                                      Obx(() {

                                        return AppText(
                                          '₹ ${balanceController.balance.value.toStringAsFixed(1)}',
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        );
                                      }),
                                    ],
                                  ),
                                  ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.amber[600],
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 10,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () {},
                                    icon:
                                    const Icon(Icons.add_circle, size: 18),
                                    label: AppText(
                                      'Add Money',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// Address Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.blue,
                                size: 24,
                              ),
                            ),
                            Spacing.w12,
                            const AppText(
                              'Address',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        Spacing.h16,
                        _buildAddressRow('Outlet Name', profile?.outletName ?? 'N/A'),
                        _buildAddressRow('City', profile?.city ?? 'N/A'),
                        _buildAddressRow('State', profile?.state ?? 'N/A'),
                        _buildAddressRow('Address', profile?.address ?? 'N/A'),
                        _buildAddressRow('Pincode', profile?.pincode ?? 'N/A'),
                      ],
                    ),
                  ),
                ),
              ),
              Spacing.h8,

              /// Change Password Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.lock_outline,
                        color: Colors.orange,
                        size: 32,
                      ),
                    ),
                    title: const AppText(
                        'Change Password',
                        fontWeight: FontWeight.bold, fontSize: 16
                    ),
                    subtitle: const Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: AppText(
                          'Change login password every week or month to secure account.',
                          fontSize: 12, color: Colors.grey
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Get.toNamed(AppRoutes.changePassword);
                    },
                  ),
                ),
              ),
              Spacing.h8,

              /// Change Pin Password Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child:
                      const Icon(Icons.pin, color: Colors.blue, size: 32),
                    ),
                    title: const AppText(
                      'Change Pin Password',
                    fontWeight: FontWeight.bold, fontSize: 16
                    ),

                    subtitle: const Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: AppText(
                        'Change pin password to secure transaction.',
                     fontSize: 12, color: Colors.grey
                      ),

                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                    onTap: () {  Get.toNamed(AppRoutes.changePin);},
                  ),
                ),
              ),
              Spacing.h8,

              /// Update Profile Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.green,
                        size: 32,
                      ),
                    ),
                    title: AppText(
                      'Update Profile',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    subtitle: const Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: AppText(
                        'Change and Update the User details, address and Other Information',
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Get.toNamed(AppRoutes.updateProfile);
                    },
                  ),
                ),
              ),

              Spacing.h120,
            ],
          ),
        );
      }),
    );
  }
  Widget _buildAddressRow(String label, String? value) {
    if (value == null || value.trim().isEmpty || value == "null") {
      return const SizedBox(); // hide row
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          const Text(': ', style: TextStyle(color: Colors.grey)),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

}


