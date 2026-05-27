import '../../domain/models/gig_job.dart';
import '../services/mock_job_service.dart';

class JobRepository {
  JobRepository(this._jobService);

  final MockJobService _jobService;
  List<GigJob>? _cachedJobs;

  Future<List<GigJob>> listUrgentJobs() async {
    return _cachedJobs ??= await _jobService.fetchUrgentJobs();
  }

  Future<GigJob?> findById(String id) async {
    final jobs = await listUrgentJobs();
    for (final job in jobs) {
      if (job.id == id) {
        return job;
      }
    }
    return null;
  }
}
