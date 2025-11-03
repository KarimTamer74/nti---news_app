import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/shared_widgets/error_widget.dart';
import 'package:news_app/core/shared_widgets/loading_indicator_widget.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/features/home/data/models/article_model.dart';
import 'package:news_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:news_app/features/home/presentation/cubit/home_states.dart';
import 'package:news_app/features/home/presentation/widgets/trending_news_item_widget.dart';

class TrendingNewsSection extends StatelessWidget {
  const TrendingNewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        spacing: 20,
        children: [
          Row(
            children: [
              Icon(Icons.trending_up, color: AppColors.red, size: 32),

              Text(
                "  Trending Now",
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) =>
                current is GetTrendingNewsFailure ||
                current is GetTrendingNewsLoading ||
                current is GetTrendingNewsLoaded,

            builder: (context, state) {
              if (state is GetTrendingNewsLoading) {
                return LoadingIndicatorWidget();
              } else if (state is GetTrendingNewsFailure) {
                return CustomErrorWidget();
              } else if (state is GetTrendingNewsLoaded) {
                final List<ArticleModel> articles = state.articles;
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: TrendingNewsItemWidget(
                          article: articles[index],
                          index: index,
                        ),
                      );
                    },
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
