import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/features/home/presentation/screens/home_screen.dart';
import 'package:news_app/features/source/presentation/cubit/source_cubit.dart';
import 'package:news_app/features/source/presentation/screens/source_screen.dart';

class MainView extends StatefulWidget {
  const MainView({super.key, this.initialIndex = 0});
  final int initialIndex;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late int _currentPageIndex;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = widget.initialIndex;
  }

  final List<TabItem> _navBarItems = [
    const TabItem(icon: Icons.home_outlined, title: "Home"),
    const TabItem(icon: Icons.source, title: "Source"),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  List<Widget> getBottomNavigationBarBody() {
    return [
      HomeScreen(),
      BlocProvider(
        create: (context) => SourceCubit()..getNewsSources(category: ''),
        child: SourceScreen(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBottomNavigationBarBody()[_currentPageIndex],
      bottomNavigationBar: ConvexAppBar(
        key: ValueKey(_currentPageIndex),
        height: 55,
        curve: Curves.easeInOut,
        color: AppColors.white,
        backgroundColor: AppColors.backgroundColor,
        elevation: 5,
        activeColor: AppColors.white,
        items: _navBarItems,
        initialActiveIndex: _currentPageIndex,
        onTap: _onTabSelected,
      ),
    );
  }
}
