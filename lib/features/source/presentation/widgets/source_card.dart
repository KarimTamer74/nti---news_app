import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';

import '../../data/models/source_model.dart';

class SourceCard extends StatelessWidget {
  final SourceModel source;
  const SourceCard({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.fillColor,
              child: Text(
                source.name.substring(0, 1),
                style: const TextStyle(color: AppColors.accent),
              ),
            ),
            title: Text(
              source.name,
              style: const TextStyle(color: AppColors.white),
            ),
            subtitle: Text(
              source.description,
              style: const TextStyle(color: AppColors.grey),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Chip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16),
              ),
              label: Text(source.category),
              backgroundColor: AppColors.fillColor,
              labelStyle: const TextStyle(color: AppColors.white),
            ),
          ),
          Row(
            spacing: 15,
            children: [
              Spacer(),
              Chip(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(16),
                ),
                label: Text(source.language),
                backgroundColor: AppColors.black,
                labelStyle: const TextStyle(color: AppColors.accent),
              ),
              Chip(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(16),
                ),
                label: Text(source.country),
                backgroundColor: AppColors.black,
                labelStyle: const TextStyle(color: AppColors.accent),
              ),
              Spacer(flex: 3),
            ],
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
