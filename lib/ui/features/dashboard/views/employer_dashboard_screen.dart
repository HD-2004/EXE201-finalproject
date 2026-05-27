import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/gig_bottom_navigation.dart';
import '../../../core/widgets/screen_frame.dart';

class EmployerDashboardScreen extends StatelessWidget {
  const EmployerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.employerDashboardTitle)),
      bottomNavigationBar: const GigBottomNavigation(selectedIndex: 2),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: AppColors.secondary,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: Text(l10n.postJob),
      ),
      body: ScreenFrame(
        child: ListView(
          children: [
            _EmployerMetric(
              label: l10n.employerOpenRoles,
              value: '12',
              icon: Icons.work_outline,
            ),
            const SizedBox(height: AppSpacing.md),
            _EmployerMetric(
              label: l10n.employerPendingApplications,
              value: '48',
              icon: Icons.group_outlined,
            ),
            const SizedBox(height: AppSpacing.md),
            _EmployerMetric(
              label: l10n.employerCompletionRate,
              value: '96%',
              icon: Icons.verified_user_outlined,
            ),
          ],
        ),
      ),
    );
  }
}

class _EmployerMetric extends StatelessWidget {
  const _EmployerMetric({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primary.withValues(alpha: 0.12),
              foregroundColor: AppColors.primaryDark,
              child: Icon(icon),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(child: Text(label)),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.primaryDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
