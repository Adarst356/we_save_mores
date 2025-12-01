import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final alternateMobileController = TextEditingController();
  final dobController = TextEditingController();
  final pincodeController = TextEditingController();
  final addressController = TextEditingController();
  final aadharController = TextEditingController();
  final panController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A148C),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Update Profile',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Name
              _buildLabel('Name :'),
              _buildTextField(
                controller: nameController,
                readOnly: true,
              ),
              const SizedBox(height: 16),

              /// Email
              _buildLabel('Email Id :'),
              _buildTextField(
                controller: emailController,
                readOnly: true,
              ),
              const SizedBox(height: 16),

              /// Mobile Number
              _buildLabel('Mobile Number :'),
              _buildTextField(
                controller: mobileController,
                readOnly: true,
              ),
              const SizedBox(height: 16),

              /// Alternate Mobile Number
              _buildLabel('Alternate Mobile Number :'),
              _buildTextField(
                controller: alternateMobileController,
                hintText: 'Enter Alternate Mobile Number',
              ),
              const SizedBox(height: 16),

              /// Date of Birth
              _buildLabel('Date Of Birth :'),
              _buildTextField(
                controller: dobController,
                readOnly: true,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today,
                      color: Color(0xFF4A148C), size: 20),
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) {
                      dobController.text =
                      "${date.day.toString().padLeft(2, '0')} ${_getMonthName(date.month)} ${date.year}";
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),

              /// Pincode
              _buildLabel('Pincode :'),
              _buildTextField(
                controller: pincodeController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              /// Address
              _buildLabel('Address :'),
              _buildTextField(
                controller: addressController,
              ),
              const SizedBox(height: 16),

              /// AADHAR
              _buildLabel('AADHAR :'),
              _buildTextField(
                controller: aadharController,
                hintText: 'Enter AADHAR',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              /// PAN
              _buildLabel('PAN :'),
              _buildTextField(
                controller: panController,
                hintText: 'Enter PAN',
              ),
              const SizedBox(height: 30),

              /// Update Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle update profile
                    Get.snackbar(
                      'Success',
                      'Profile updated successfully',
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFA726),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Update Profile',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF4A148C),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    String? hintText,
    bool readOnly = false,
    TextInputType? keyboardType,
    Widget? suffixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        keyboardType: keyboardType,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontSize: 14,
          ),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }
}