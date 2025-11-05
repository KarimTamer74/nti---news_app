import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/shared_widgets/category_section.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/features/home/presentation/cubit/home_cubit.dart';

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
          //* Search Field
          TextField(
            onChanged: (value) {
              BlocProvider.of<HomeCubit>(context).searchForNews(value);
            },
            style: TextStyle(color: AppColors.white),
            controller: _controller,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {
                  BlocProvider.of<HomeCubit>(
                    context,
                  ).searchForNews(_controller.text);
                },
                icon: Icon(Icons.search, color: AppColors.white),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  _controller.clear();
                  BlocProvider.of<HomeCubit>(context).searchForNews('');
                },
                icon: Icon(Icons.close, color: AppColors.white),
              ),
              hintText: 'Search for articles...',
              hintStyle: TextStyle(color: AppColors.white),
              filled: true,
              fillColor: AppColors.fillColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
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
