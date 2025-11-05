import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/shared_widgets/category_section.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/features/source/presentation/cubit/source_cubit.dart';
import 'package:news_app/features/source/presentation/widgets/sources_list_view.dart';

import '../widgets/search_bar.dart';

class SourceScreen extends StatefulWidget {
  const SourceScreen({super.key});

  @override
  State<SourceScreen> createState() => _SourceScreenState();
}

class _SourceScreenState extends State<SourceScreen> {
  int currentIndex = 0;
  String selectedCategory = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text(
          'InsightFeed',
          style: TextStyle(color: AppColors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: AppColors.accent),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          spacing: 16,
          children: [
            SearchBarWidget(onChanged: (String value) {}),
            CategorySection(
              onCategorySelected: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              currentIndex: currentIndex,
              selected: (String category) {
                setState(() {
                  selectedCategory = category;
                });
                BlocProvider.of<SourceCubit>(
                  context,
                ).getNewsSources(category: category);
              },
            ),
            Expanded(child: SourcesListView()),
          ],
        ),
      ),
    );
  }
}
