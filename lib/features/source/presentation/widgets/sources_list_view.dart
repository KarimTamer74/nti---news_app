import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/shared_widgets/error_widget.dart';
import 'package:news_app/core/shared_widgets/loading_indicator_widget.dart';
import 'package:news_app/core/shared_widgets/no_items_found.dart';
import 'package:news_app/features/source/data/models/source_model.dart';
import 'package:news_app/features/source/presentation/cubit/source_cubit.dart';
import 'package:news_app/features/source/presentation/cubit/source_states.dart';
import 'package:news_app/features/source/presentation/widgets/source_card.dart';

class SourcesListView extends StatelessWidget {
  const SourcesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SourceCubit, SourceState>(
      builder: (context, state) {
        if (state is GetSourcesFailure) {
          return CustomErrorWidget();
        } else if (state is GetSourcesLoading) {
          return LoadingIndicatorWidget();
        } else if (state is GetSourcesLoaded) {
          final List<SourceModel> sources = state.sources;
          return sources.isEmpty
              ? NoItemsFound(message: "No Sources Found")
              : ListView.builder(
                  itemCount: sources.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: SourceCard(source: sources[index]),
                  ),
                );
        }
        return SizedBox.shrink();
      },
    );
  }
}
