import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/shared_widgets/category_section.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:news_app/features/source/presentation/widgets/search_bar.dart';

class HomeScreenTopSection extends StatefulWidget {
  const HomeScreenTopSection({super.key});

  @override
  State<HomeScreenTopSection> createState() => _HomeScreenTopSectionState();
}

class _HomeScreenTopSectionState extends State<HomeScreenTopSection> {
  final TextEditingController _controller = TextEditingController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.white)),
      ),
      child: Column(
        children: [
          SearchBarField(
            hintText: 'Search for articles...',
            controller: _controller,
            onChanged: (value) {
              BlocProvider.of<HomeCubit>(context).searchForNews(value);
            },
            onClear: () {
              _controller.clear();
              BlocProvider.of<HomeCubit>(context).searchForNews('');
            },
            onSearch: () {
              BlocProvider.of<HomeCubit>(
                context,
              ).searchForNews(_controller.text);
            },
          ),

          SizedBox(height: 16),
          //* Categories List View
          CategorySection(
            currentIndex: currentIndex,
            onCategorySelected: (int value) {
              setState(() {
                currentIndex = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
