import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'data/repositories/job_repository.dart';
import 'data/services/mock_job_service.dart';
import 'l10n/app_localizations.dart';
import 'routing/app_router.dart';
import 'ui/core/theme/app_theme.dart';
import 'ui/features/jobs/view_models/jobs_view_model.dart';

class OppoApp extends StatelessWidget {
  const OppoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => MockJobService()),
        Provider(
          create: (context) => JobRepository(context.read<MockJobService>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              JobsViewModel(context.read<JobRepository>())..loadUrgentJobs(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Ốp Pờ',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        routerConfig: appRouter,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
