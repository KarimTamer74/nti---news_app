import 'package:news_app/features/home/data/models/article_model.dart';

abstract class HomeState {}

class HomeStateInitial extends HomeState {}

class GetTrendingNewsLoading extends HomeState {}

class GetTrendingNewsLoaded extends HomeState {
  final List<ArticleModel> articles;

  GetTrendingNewsLoaded({required this.articles});
}

class GetTrendingNewsFailure extends HomeState {}

class GetAllNewsLoading extends HomeState {}

class GetAllNewsLoaded extends HomeState {
  final List<ArticleModel> articles;

  GetAllNewsLoaded({required this.articles});
}

class GetAllNewsFailure extends HomeState {}
