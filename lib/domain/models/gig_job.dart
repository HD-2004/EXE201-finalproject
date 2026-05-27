import 'package:flutter/foundation.dart';

@immutable
class GigJob {
  const GigJob({
    required this.id,
    required this.title,
    required this.employerName,
    required this.location,
    required this.shiftTime,
    required this.wageLabel,
    required this.statusLabel,
    required this.isVerified,
    required this.tags,
    required this.description,
  });

  final String id;
  final String title;
  final String employerName;
  final String location;
  final String shiftTime;
  final String wageLabel;
  final String statusLabel;
  final bool isVerified;
  final List<String> tags;
  final String description;
}
