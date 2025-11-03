import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/features/home/data/models/article_model.dart';

class TrendingNewsItemWidget extends StatelessWidget {
  const TrendingNewsItemWidget({
    super.key,
    required this.article,
    required this.index,
  });
  final ArticleModel article;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15,
        children: [
          Text(
            '${index + 1}',
            style: TextStyle(color: AppColors.white, fontSize: 22),
          ),
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(15),
              child: Image.network(article.image, width: 150),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  softWrap: true,
                  maxLines: 1,
                  textWidthBasis: TextWidthBasis.parent,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  article.author,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
