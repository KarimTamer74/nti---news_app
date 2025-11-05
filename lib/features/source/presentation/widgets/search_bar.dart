import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';

class SearchBarField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSearch;
  final VoidCallback? onClear;
final String? hintText;
  const SearchBarField({
    super.key,
    required this.controller,
    this.onChanged,
    this.onSearch,
    this.onClear, this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: AppColors.white),
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: IconButton(
          onPressed: onSearch,
          icon: const Icon(Icons.search, color: AppColors.white),
        ),
        suffixIcon: IconButton(
          onPressed: onClear,
          icon: const Icon(Icons.close, color: AppColors.white),
        ),
        hintText:hintText,
        hintStyle: const TextStyle(color: AppColors.white),
        filled: true,
        fillColor: AppColors.fillColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
