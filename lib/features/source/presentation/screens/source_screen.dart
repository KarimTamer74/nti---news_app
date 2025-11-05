import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/shared_widgets/category_section.dart';
import 'package:news_app/core/shared_widgets/my_app_bar.dart';
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
  final TextEditingController _controller = TextEditingController();
  int currentIndex = 0;
  String selectedCategory = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: MyAppBar(onActionPressed: () {}),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          spacing: 16,
          children: [
            SearchBarField(
              hintText: 'Search for sources...',
              controller: _controller,
              onChanged: (value) {
                BlocProvider.of<SourceCubit>(
                  context,
                ).searchForNewsSource(value);
              },
              onClear: () {
                _controller.clear();
                BlocProvider.of<SourceCubit>(context).searchForNewsSource('');
              },
              onSearch: () {
                BlocProvider.of<SourceCubit>(
                  context,
                ).searchForNewsSource(_controller.text);
              },
            ),

            CategorySection(
              onCategorySelected: (index) {
                setState(() {
                  currentIndex = index;
                });
                BlocProvider.of<SourceCubit>(
                  context,
                ).searchForNewsSource(_controller.text);
              },
              currentIndex: currentIndex,
              selected: (String category) async {
                setState(() {
                  selectedCategory = category;
                });

                final cubit = BlocProvider.of<SourceCubit>(context);
                await cubit.getNewsSources(category: category);
                cubit.searchForNewsSource(_controller.text);
              },
            ),
            Expanded(child: SourcesListView()),
          ],
        ),
      ),
    );
  }
}
