// NoItemsFound.dart
// A reusable Flutter widget showing a professional "No items found" UI.
// Accepts a required `message` string and optional callback for an action button.

import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';

class NoItemsFound extends StatelessWidget {
  final String message;

  const NoItemsFound({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search_off_outlined, size: 100, color: AppColors.grey),
          const SizedBox(height: 18),
          Text(
            'Nothing here',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: AppColors.grey),
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}
