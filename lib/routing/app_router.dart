import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/features/dashboard/views/candidate_dashboard_screen.dart';
import '../ui/features/dashboard/views/employer_dashboard_screen.dart';
import '../ui/features/jobs/views/candidate_jobs_screen.dart';
import '../ui/features/jobs/views/job_detail_screen.dart';
import '../ui/features/onboarding/views/welcome_screen.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.welcome,
  routes: [
    GoRoute(
      path: AppRoutes.welcome,
      name: AppRouteNames.welcome,
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.candidateJobs,
      name: AppRouteNames.candidateJobs,
      builder: (context, state) => const CandidateJobsScreen(),
    ),
    GoRoute(
      path: AppRoutes.candidateDashboard,
      name: AppRouteNames.candidateDashboard,
      builder: (context, state) => const CandidateDashboardScreen(),
    ),
    GoRoute(
      path: AppRoutes.employerDashboard,
      name: AppRouteNames.employerDashboard,
      builder: (context, state) => const EmployerDashboardScreen(),
    ),
    GoRoute(
      path: AppRoutes.jobDetail,
      name: AppRouteNames.jobDetail,
      builder: (context, state) {
        final jobId = state.pathParameters['jobId'] ?? '';
        return JobDetailScreen(jobId: jobId);
      },
    ),
  ],
  errorBuilder: (context, state) => ErrorScreen(error: state.error),
);

abstract final class AppRoutes {
  static const welcome = '/welcome';
  static const candidateJobs = '/candidate/jobs';
  static const candidateDashboard = '/candidate/dashboard';
  static const employerDashboard = '/employer/dashboard';
  static const jobDetail = '/jobs/:jobId';

  static String jobDetails(String jobId) => '/jobs/$jobId';
}

abstract final class AppRouteNames {
  static const welcome = 'welcome';
  static const candidateJobs = 'candidate-jobs';
  static const candidateDashboard = 'candidate-dashboard';
  static const employerDashboard = 'employer-dashboard';
  static const jobDetail = 'job-detail';
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, this.error});

  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          error?.toString() ?? 'Route not found',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
