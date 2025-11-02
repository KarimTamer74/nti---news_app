import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/data/data_source/remote_data_source.dart';
import 'package:news_app/features/home/presentation/cubit/home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateInitial());
  final RemoteDataSource remoteDataSource = RemoteDataSource();
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
}
