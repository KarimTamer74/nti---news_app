import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';

class CategorySection extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onCategorySelected;
  final Function(String)? selected;
  const CategorySection({
    super.key,
    required this.currentIndex,
    required this.onCategorySelected,
    this.selected,
  });
  static const List<String> categories = [
    'All',
    'Technology',
    'Politics',
    'Sports',
    'Entertainment',
    'World',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = currentIndex == index;
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              splashColor: AppColors.black,
              onTap: () {
                onCategorySelected(index);
                selected!(categories[index]);
              },
              child: Chip(
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                backgroundColor: isSelected
                    ? AppColors.blue
                    : AppColors.fillColor,
                label: Text(
                  categories[index],
                  style: const TextStyle(color: AppColors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
