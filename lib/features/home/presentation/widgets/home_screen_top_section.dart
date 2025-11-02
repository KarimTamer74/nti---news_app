import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';

class HomeScreenTopSection extends StatefulWidget {
  const HomeScreenTopSection({super.key});

  @override
  State<HomeScreenTopSection> createState() => _HomeScreenTopSectionState();
}

class _HomeScreenTopSectionState extends State<HomeScreenTopSection> {
  List<String> categories = [
    'All',
    'Technology',
    'Politics',
    'Sports',
    'Entertainment',
    'World',
  ];
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
            controller: _controller,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: AppColors.white),
              ),
              suffixIcon: IconButton(
                onPressed: () {},
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
          //* Categories List View
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    splashColor: AppColors.black,
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: Chip(
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(15),
                      ),
                      backgroundColor: currentIndex == index
                          ? AppColors.blue
                          : AppColors.fillColor,
                      label: Text(
                        categories[index],
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
