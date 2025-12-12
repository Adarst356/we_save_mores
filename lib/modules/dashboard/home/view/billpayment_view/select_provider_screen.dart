import 'package:flutter/material.dart';
import 'package:we_save_more/theme/app_colors.dart';

class SelectProviderScreen extends StatelessWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      appBar: AppBar(
        backgroundColor:appColors.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Select Provider",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
      ),

      body: ListView(
        children: [

          // 🔍 SEARCH BAR
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Icon(Icons.search, size: 22, color: Colors.grey),
                  const SizedBox(width: 8),

                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),

                  // Clear icon (UI only, no logic)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(Icons.clear, size: 20, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),

          // Category Title
          Container(
            width: double.infinity,
            color: appColors.primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: const Text(
              "Electricity Provider",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Provider List
          providerTile("assets/logo/adani.png", "Adani Electricity Mumbai Ltd"),
          providerTile("assets/logo/avvnl.png", "Ajmer Vidyut Vitran Nigam Ltd. (AVVNL)"),
          providerTile("assets/logo/apepdcl.png", "APEPDCL - Eastern Power Distribution CO AP Ltd"),
          providerTile("assets/logo/apspdcl.png", "APSPDCL - Southern Power Distribution CO AP Ltd"),
          providerTile("assets/logo/apdcl.png", "Assam Power Distribution Company Ltd (NON-RAPDR)"),
          providerTile("assets/logo/apdcl2.png", "Assam Power Distribution Company Ltd (RAPDR)"),
          providerTile("assets/logo/bescom.png", "Bangalore Electricity Supply Company Ltd. (BESCOM)"),
          providerTile("assets/logo/bharatpur.png", "Bharatpur Electricity Services Ltd."),
        ],
      ),
    );
  }

  // Provider Tile Widget
  Widget providerTile(String image, String title) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: AssetImage(image),
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

        Container(
          height: 1.6,
          color: Colors.amber,
        ),
      ],
    );
  }
}
