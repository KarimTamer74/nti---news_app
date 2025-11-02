import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/features/home/data/models/article_model.dart';

class RemoteDataSource {
  final Dio dio = Dio();
  Future<List<ArticleModel>> getTrendingNews() async {
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/everything?q=bitcoin',
        options: Options(
          headers: {'Authorization': '91c41cfc3411480da5d4aca3a46a33d3'},
        ),
      );
      final List<ArticleModel> articles = [];
      final Map<String, dynamic> data = response.data;
      data['articles'].forEach((element) {
        articles.add(ArticleModel.fromJson(element));
      });
      return articles;
    } on DioException catch (error) {
      log("Dio Error: $error");
      return [];
    } on Exception catch (e) {
      log("Error: $e");
      return [];
    }
  }
}
