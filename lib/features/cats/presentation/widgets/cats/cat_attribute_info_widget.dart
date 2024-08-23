import 'package:flutter/material.dart';

class CatAttributeInfoWidget extends StatelessWidget {
  final String title;
  final String content;

  const CatAttributeInfoWidget({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8.0),
          Text(content),
        ],
      ),
    );
  }
}