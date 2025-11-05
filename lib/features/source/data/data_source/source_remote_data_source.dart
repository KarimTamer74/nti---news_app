import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/features/source/data/models/source_model.dart';

class SourceRemoteDataSource {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://newsapi.org/v2/'));
  Future<List<SourceModel>> getNewsSoucres({required String category}) async {
    try {
      Response response = await dio.get(
        'top-headlines/sources?category=$category',
        options: Options(
          headers: {'Authorization': '91c41cfc3411480da5d4aca3a46a33d3'},
        ),
      );
      final List<SourceModel> sources = [];
      final Map<String, dynamic> data = response.data;
      data['sources'].forEach((element) {
        sources.add(SourceModel.fromJson(element));
      });
      return sources;
    } on DioException catch (error) {
      log("Dio Error: $error");
      return [];
    } on Exception catch (e) {
      log("Error: $e");
      return [];
    }
  }
}
