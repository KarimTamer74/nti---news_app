import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/features/home/data/models/article_model.dart';

class RemoteDataSource {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://newsapi.org/v2/'));
  Future<List<ArticleModel>> getTrendingNews() async {
    try {
      Response response = await dio.get(
        'top-headlines?country=us',
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

  Future<List<ArticleModel>> getAllNews() async {
    try {
      Response response = await dio.get(
        'everything?q=bitcoin',
        options: Options(
          headers: {'X-Api-Key': '91c41cfc3411480da5d4aca3a46a33d3'},
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
