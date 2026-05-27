import 'package:flutter/foundation.dart';

import '../../../../data/repositories/job_repository.dart';
import '../../../../domain/models/gig_job.dart';

class JobsViewModel extends ChangeNotifier {
  JobsViewModel(this._jobRepository);

  final JobRepository _jobRepository;

  bool _isLoading = false;
  List<GigJob> _jobs = const [];

  bool get isLoading => _isLoading;
  List<GigJob> get jobs => List.unmodifiable(_jobs);

  Future<void> loadUrgentJobs() async {
    _isLoading = true;
    notifyListeners();

    _jobs = await _jobRepository.listUrgentJobs();
    _isLoading = false;
    notifyListeners();
  }
}
