import 'package:flutter/material.dart';

import '../../../../core/utils/custom_colors.dart';
import '../../../../core/utils/text_styles.dart';

class MessageDisplay extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const MessageDisplay({super.key, required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.lightGray,
      appBar: AppBar(
        title: const Text('Catbreeds'),
        backgroundColor: CustomColors.lightGray,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              message,
              style: CustomTextStyles.gilroyBold,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 20), // Adds space between text and button
          ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              foregroundColor: CustomColors.lightGray, // Background color
              backgroundColor: CustomColors.black, // Text color
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              textStyle: const TextStyle(fontSize: 16),
            ),
            child: const Text('Intentar de nuevo'),
          ),
        ],
      ),
    );
  }
}