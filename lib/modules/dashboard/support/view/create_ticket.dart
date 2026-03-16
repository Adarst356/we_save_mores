import 'package:flutter/material.dart';

import '../../../../utils/custom_appbar.dart';

class CreateTicket extends StatelessWidget {
  const CreateTicket({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppbar(
        title: "Transaction Report",
        showLeft: false,
        leftIcon: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: theme.colorScheme.onPrimary),
        ),
        rightIcon: GestureDetector(
          onTap: () {

          },
          child: Icon(
            Icons.filter_list,
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
