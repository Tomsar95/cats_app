import 'package:flutter/material.dart';

import '../../../../core/utils/text_styles.dart';

class MessageDisplay extends StatelessWidget {
  final String message;
  const MessageDisplay({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50),
      child: Center(
        child: Text(
          message,
          style: CustomTextStyles.gilroyLight,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}