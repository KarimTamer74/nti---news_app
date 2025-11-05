import 'package:news_app/features/source/data/models/source_model.dart';

abstract class SourceState {}

class SourceStateInitial extends SourceState {}

class GetSourcesLoading extends SourceState {}
class GetSourcesFailure extends SourceState {}

class GetSourcesLoaded extends SourceState {
  final List<SourceModel> sources;

  GetSourcesLoaded({required this.sources});
}
