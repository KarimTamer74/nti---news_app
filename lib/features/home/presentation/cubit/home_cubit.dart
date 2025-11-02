import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/data/data_source/remote_data_source.dart';
import 'package:news_app/features/home/data/models/article_model.dart';
import 'package:news_app/features/home/presentation/cubit/home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateInitial());
  final RemoteDataSource remoteDataSource = RemoteDataSource();
  List<ArticleModel> articles = [];
  Future<void> getTrendingNews() async {
    emit(GetTrendingNewsLoading());
    await remoteDataSource.getTrendingNews().then(
      (value) {
        log("Articles: $value", name: 'Get Trending News');
        emit(GetTrendingNewsLoaded(articles: value));
      },
      onError: (error) {
        log("Error $error", name: "Get Trending News");
        emit(GetTrendingNewsFailure());
      },
    );
  }

  Future<void> getAllNews() async {
    emit(GetAllNewsLoading());
    await remoteDataSource.getTrendingNews().then(
      (value) {
        log("Articles: $value", name: 'Get Trending News');
        articles = value;
        emit(GetAllNewsLoaded(articles: value));
      },
      onError: (error) {
        log("Error $error", name: "Get Trending News");
        emit(GetAllNewsFailure());
      },
    );
  }

  List<ArticleModel> searchForNews(String query) {
    final List<ArticleModel> filteredList = [];
    log("Query: $query");
    log("Articls: $articles");
    for (var element in articles) {
      if (element.title.toLowerCase().contains(query.toLowerCase())) {
        filteredList.add(element);
      }
    }
    log("Filtered lenght ${filteredList.length}");
    emit(GetAllNewsLoaded(articles: filteredList));

    return filteredList;
  }
}
