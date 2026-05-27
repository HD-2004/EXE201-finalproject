import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/repositories/job_repository.dart';
import '../../../../domain/models/gig_job.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/screen_frame.dart';
import '../../../core/widgets/status_chip.dart';

class JobDetailScreen extends StatelessWidget {
  const JobDetailScreen({required this.jobId, super.key});

  final String jobId;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.jobDetailTitle)),
      body: FutureBuilder<GigJob?>(
        future: context.read<JobRepository>().findById(jobId),
        builder: (context, snapshot) {
          final job = snapshot.data;
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (job == null) {
            return Center(child: Text(l10n.notFoundTitle));
          }

          return ScreenFrame(
            child: ListView(
              children: [
                Row(
                  children: [
                    StatusChip(
                      label: job.statusLabel,
                      variant: StatusChipVariant.urgent,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    if (job.isVerified)
                      StatusChip(
                        label: l10n.verifiedBadge,
                        variant: StatusChipVariant.verified,
                      ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  job.title,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  job.employerName,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _DetailLine(
                          label: l10n.hourlyRateLabel,
                          value: job.wageLabel,
                          icon: Icons.payments_outlined,
                        ),
                        _DetailLine(
                          label: l10n.locationLabel,
                          value: job.location,
                          icon: Icons.place_outlined,
                        ),
                        _DetailLine(
                          label: l10n.shiftTimeLabel,
                          value: job.shiftTime,
                          icon: Icons.schedule,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(job.description),
                const SizedBox(height: AppSpacing.xl),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.flash_on),
                  label: Text(l10n.applyNow),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _DetailLine extends StatelessWidget {
  const _DetailLine({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label.toUpperCase(),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(value, style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
