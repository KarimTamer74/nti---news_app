import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/shared_widgets/error_widget.dart';
import 'package:news_app/core/shared_widgets/loading_indicator_widget.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/features/home/data/models/article_model.dart';
import 'package:news_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:news_app/features/home/presentation/cubit/home_states.dart';
import 'package:news_app/features/home/presentation/widgets/all_news_item_widget.dart';

class AllNewsSection extends StatelessWidget {
  const AllNewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is GetAllNewsFailure ||
          current is GetAllNewsLoading ||
          current is GetAllNewsLoaded,
      builder: (context, state) {
        if (state is GetAllNewsLoading) {
          return LoadingIndicatorWidget();
        } else if (state is GetAllNewsFailure) {
          return CustomErrorWidget();
        } else if (state is GetAllNewsLoaded) {
          final List<ArticleModel> allNewsArticles = state.articles;
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: allNewsArticles.isEmpty
                ? Center(
                    child: Text(
                      "No News Found",
                      style: TextStyle(color: AppColors.white, fontSize: 28),
                    ),
                  )
                : ListView.builder(
                    itemCount: allNewsArticles.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: AllNewsItemWidget(
                            article: allNewsArticles[index],
                          ),
                        ),
                      );
                    },
                  ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
