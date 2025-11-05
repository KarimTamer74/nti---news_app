import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onActionPressed;

  const MyAppBar({super.key, this.onActionPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.black,
      title: Text(
        'InsightFeed',
        style: const TextStyle(
          fontSize: 22,
          color: AppColors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        IconButton(
          onPressed: onActionPressed,
          icon: Icon(Icons.sunny, color: AppColors.white, size: 28),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
