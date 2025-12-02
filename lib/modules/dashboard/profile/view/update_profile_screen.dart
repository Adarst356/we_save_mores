import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../utils/custom_appbar.dart';
import '../../../../widget/customs_dialog.dart';
import 'update_profile_controller.dart';

class UpdateProfileScreen extends GetView<UpdateProfileController> {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: CustomAppbar(
        title: "Update Profile",
        showLeft: true,
        leftIcon: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: theme.colorScheme.onPrimary),
        ),
      ),
      body: Obx(() {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel('Name :'),
                    _buildTextField(controller: controller.nameController),
                    const SizedBox(height: 16),

                    _buildLabel('Email Id :'),
                    _buildTextField(controller: controller.emailController, readOnly: true),
                    const SizedBox(height: 16),

                    _buildLabel('Mobile Number :'),
                    _buildTextField(controller: controller.mobileController, readOnly: true),
                    const SizedBox(height: 16),

                    _buildLabel('Alternate Mobile Number :'),
                    _buildTextField(
                      controller: controller.alternateMobileController,
                      hintText: 'Enter Alternate Mobile Number',
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    const SizedBox(height: 16),

                    _buildLabel('Date Of Birth :'),
                    _buildTextField(
                      controller: controller.dobController,
                      readOnly: true,
                      hintText: 'Select Date of Birth',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today, color: Color(0xFF4A148C), size: 20),
                        onPressed: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
                            firstDate: DateTime(1950),
                            lastDate: DateTime.now(),
                          );
                          if (date != null) {
                            controller.dobController.text =
                            "${date.day.toString().padLeft(2, '0')} ${_getMonthName(date.month)} ${date.year}";
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 16),

                    _buildLabel('Pincode :'),
                    _buildTextField(
                      controller: controller.pincodeController,
                      hintText: 'Enter Pincode',
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    const SizedBox(height: 16),

                    _buildLabel('Address :'),
                    _buildTextField(controller: controller.addressController, maxLines: 3),
                    const SizedBox(height: 16),

                    _buildLabel('AADHAAR Number :'),
                    _buildTextField(
                      controller: controller.aadharController,
                      hintText: 'Enter AADHAR Number',
                      keyboardType: TextInputType.number,
                      maxLength: 12,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    const SizedBox(height: 16),

                    _buildLabel('PAN :'),
                    _buildTextField(
                      controller: controller.panController,
                      hintText: 'Enter PAN Number',
                      maxLength: 10,
                      textCapitalization: TextCapitalization.characters,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]'))],
                    ),
                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: controller.isLoading.value
                            ? null
                            : () {
                          if (controller.validateFields()) {
                            controller.updateUserProfile();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFA726),
                          disabledBackgroundColor: Colors.grey[400],
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: controller.isLoading.value
                            ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        )
                            : const Text(
                          'Update Profile',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            if (controller.isLoading.value)
              Container(
                color: Colors.black26,
                child: const Center(
                  child: CircularProgressIndicator(color: Color(0xFF4A148C)),
                ),
              ),
          ],
        );
      }),
    );
  }

  Widget _buildLabel(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(text, style: const TextStyle(fontSize: 14, color: Color(0xFF4A148C), fontWeight: FontWeight.w500)),
  );

  Widget _buildTextField({
    required TextEditingController controller,
    String? hintText,
    bool readOnly = false,
    TextInputType? keyboardType,
    Widget? suffixIcon,
    int? maxLength,
    int maxLines = 1,
    List<TextInputFormatter>? inputFormatters,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) =>
      Container(
        decoration: BoxDecoration(
          color: readOnly ? Colors.grey[200] : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))],
        ),
        child: TextField(
          controller: controller,
          readOnly: readOnly,
          keyboardType: keyboardType,
          maxLength: maxLength,
          maxLines: maxLines,
          inputFormatters: inputFormatters,
          textCapitalization: textCapitalization,
          style: TextStyle(fontSize: 14, color: readOnly ? Colors.grey[600] : Colors.black),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
            suffixIcon: suffixIcon,
            counterText: '',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: maxLines > 1 ? 16 : 14),
            filled: true,
            fillColor: readOnly ? Colors.grey[200] : Colors.white,
          ),
        ),
      );

  String _getMonthName(int month) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return months[month - 1];
  }
}
