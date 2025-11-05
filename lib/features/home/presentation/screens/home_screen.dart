import 'package:flutter/material.dart';
import 'package:news_app/core/shared_widgets/my_app_bar.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/features/home/presentation/widgets/all_news_section.dart';
import 'package:news_app/features/home/presentation/widgets/home_screen_top_section.dart';
import 'package:news_app/features/home/presentation/widgets/trending_news_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: MyAppBar(onActionPressed: () {}),
      body: Column(
        children: [
          //* HomeScreenTopSection
          Expanded(flex: 1, child: HomeScreenTopSection()),
          //* TrendingNewsSection
          Expanded(flex: 1, child: TrendingNewsSection()),
          //* AllNewsSection
          Expanded(flex: 3, child: AllNewsSection()),
        ],
      ),
    );
  }
}
