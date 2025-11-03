import 'package:flutter/material.dart';
import 'package:news_app/core/shared_widgets/loading_indicator_widget.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/features/home/data/models/article_model.dart';

class AllNewsItemWidget extends StatelessWidget {
  const AllNewsItemWidget({super.key, required this.article});
  final ArticleModel article;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(15),
          child: Image.network(
            article.image,
            fit: BoxFit.cover,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Icon(Icons.error, size: 40, color: AppColors.red),
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return LoadingIndicatorWidget();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                article.desc,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Wrap(
                children: [
                  Text(
                    article.author,
                    style: TextStyle(
                      color: AppColors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: AlignmentGeometry.topRight,
                    child: Text(
                      "2 days ago",
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
