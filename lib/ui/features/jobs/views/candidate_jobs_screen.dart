import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../domain/models/gig_job.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../routing/app_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/gig_bottom_navigation.dart';
import '../../../core/widgets/screen_frame.dart';
import '../../../core/widgets/status_chip.dart';
import '../view_models/jobs_view_model.dart';

class CandidateJobsScreen extends StatelessWidget {
  const CandidateJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final viewModel = context.watch<JobsViewModel>();

    return Scaffold(
      appBar: AppBar(title: Text(l10n.candidateJobsTitle)),
      bottomNavigationBar: const GigBottomNavigation(selectedIndex: 0),
      body: ScreenFrame(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: viewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemCount: viewModel.jobs.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: AppSpacing.md),
                itemBuilder: (context, index) {
                  final job = viewModel.jobs[index];
                  return _JobCard(
                    job: job,
                    onTap: () => context.push(AppRoutes.jobDetails(job.id)),
                  );
                },
              ),
      ),
    );
  }
}

class _JobCard extends StatelessWidget {
  const _JobCard({required this.job, required this.onTap});

  final GigJob job;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(job.title, style: textTheme.titleLarge),
                        const SizedBox(height: AppSpacing.xs),
                        Row(
                          children: [
                            Flexible(child: Text(job.employerName)),
                            if (job.isVerified) ...[
                              const SizedBox(width: AppSpacing.xs),
                              const Icon(
                                Icons.verified,
                                size: 16,
                                color: AppColors.primary,
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    job.wageLabel,
                    style: textTheme.titleLarge?.copyWith(
                      color: AppColors.secondaryDark,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              _MetaRow(icon: Icons.place_outlined, text: job.location),
              const SizedBox(height: AppSpacing.xs),
              _MetaRow(icon: Icons.schedule, text: job.shiftTime),
              const SizedBox(height: AppSpacing.md),
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: [
                  StatusChip(
                    label: job.statusLabel,
                    variant: job.statusLabel == 'Gấp'
                        ? StatusChipVariant.urgent
                        : StatusChipVariant.active,
                  ),
                  for (final tag in job.tags)
                    StatusChip(label: tag, variant: StatusChipVariant.verified),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetaRow extends StatelessWidget {
  const _MetaRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.onSurfaceVariant),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(
            text,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.onSurfaceVariant),
          ),
        ),
      ],
    );
  }
}
