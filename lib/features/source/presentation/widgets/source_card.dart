import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';

import '../../data/models/source_model.dart';

class SourceCard extends StatelessWidget {
  final SourceModel source;
  const SourceCard({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.backgroundColor,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: AppColors.fillColor,
                child: Text(
                  source.name.substring(0, 1).toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.accent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                source.name,
                style: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                source.description,
                style: const TextStyle(color: AppColors.grey),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Chip(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.accent, width: 1.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                label: Text(source.category),
                backgroundColor: AppColors.fillColor,
                labelStyle: const TextStyle(color: AppColors.white),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Spacer(flex: 1),
                  _buildInfoChip(
                    label: source.language.toUpperCase(),
                    isOutlined: false,
                  ),
                  SizedBox(width: 12),
                  _buildInfoChip(
                    label: source.country.toUpperCase(),
                    isOutlined: true,
                  ),
                  Spacer(flex: 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip({required String label, required bool isOutlined}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: Chip(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: isOutlined
              ? const BorderSide(color: AppColors.accent, width: 1.5)
              : BorderSide.none,
        ),
        backgroundColor: AppColors.black,
        label: Text(
          label,
          style: const TextStyle(
            color: AppColors.accent,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
