import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class StatusChip extends StatelessWidget {
  const StatusChip({
    required this.label,
    this.variant = StatusChipVariant.active,
    super.key,
  });

  final String label;
  final StatusChipVariant variant;

  @override
  Widget build(BuildContext context) {
    final style = switch (variant) {
      StatusChipVariant.urgent => (
        background: AppColors.secondary.withValues(alpha: 0.16),
        foreground: AppColors.secondaryDark,
      ),
      StatusChipVariant.verified => (
        background: AppColors.primary.withValues(alpha: 0.12),
        foreground: AppColors.primaryDark,
      ),
      StatusChipVariant.active => (
        background: AppColors.success.withValues(alpha: 0.12),
        foreground: AppColors.success,
      ),
    };

    return DecoratedBox(
      decoration: BoxDecoration(
        color: style.background,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          label.toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: style.foreground,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

enum StatusChipVariant { urgent, verified, active }
