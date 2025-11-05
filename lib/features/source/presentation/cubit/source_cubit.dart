import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/source/data/data_source/source_remote_data_source.dart';
import 'package:news_app/features/source/data/models/source_model.dart';
import 'package:news_app/features/source/presentation/cubit/source_states.dart';

class SourceCubit extends Cubit<SourceState> {
  SourceCubit() : super(SourceStateInitial());
  final SourceRemoteDataSource remoteDataSource = SourceRemoteDataSource();
  List<SourceModel> sources = [];
  Future<void> getNewsSources({required String category}) async {
    emit(GetSourcesLoading());
    await remoteDataSource
        .getNewsSoucres(category: category)
        .then(
          (value) {
            log("sources: $value", name: 'Get Trending News');
            emit(GetSourcesLoaded(sources: value));
          },
          onError: (error) {
            log("Error $error", name: "Get Trending News");
            emit(GetSourcesFailure());
          },
        );
  }
}
