import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';

class SearchBarWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const SearchBarWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search, color: AppColors.white),
        hintText: 'Search sources...',
        hintStyle: const TextStyle(color: AppColors.white),
        filled: true,
        fillColor: AppColors.fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: AppColors.white),
    );
  }
}
