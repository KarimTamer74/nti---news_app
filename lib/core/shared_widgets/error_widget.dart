import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Error",
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.red,
        ),
      ),
    );
    ;
  }
}
