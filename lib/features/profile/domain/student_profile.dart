import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_profile.freezed.dart';

// Drafted with OpenAI Codex. Team review pending.
@freezed
abstract class StudentProfile with _$StudentProfile {
  const factory StudentProfile({
    required String name,
    required String email,
    required String department,
    required int yearOfStudy,
    String? studentId,
    required Set<String> enrolledCourseIds,
    required List<AvailabilitySlot> availability,
  }) = _StudentProfile;

  factory StudentProfile.fromSeed(Map<String, dynamic> seed) => StudentProfile(
    name: seed['name'] as String,
    email: seed['email'] as String,
    department: seed['department'] as String,
    yearOfStudy: seed['yearOfStudy'] as int,
    studentId: 'UGR/2799/16',
    enrolledCourseIds: Set<String>.from(seed['enrolledCourseIds'] as List),
    availability: (seed['availability'] as List)
        .cast<Map<String, dynamic>>()
        .map(AvailabilitySlot.fromSeed)
        .toList(),
  );
}

@freezed
abstract class AvailabilitySlot with _$AvailabilitySlot {
  const factory AvailabilitySlot({
    required String dayOfWeek,
    required String startTime,
    required String endTime,
  }) = _AvailabilitySlot;

  factory AvailabilitySlot.fromSeed(Map<String, dynamic> seed) =>
      AvailabilitySlot(
        dayOfWeek: seed['dayOfWeek'] as String,
        startTime: seed['startTime'] as String,
        endTime: seed['endTime'] as String,
      );
}
