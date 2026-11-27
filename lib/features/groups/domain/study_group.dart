import 'package:freezed_annotation/freezed_annotation.dart';

part 'study_group.freezed.dart';

// Drafted with OpenAI Codex. Team review pending.
@freezed
abstract class StudyGroup with _$StudyGroup {
  const factory StudyGroup({
    required String id,
    required String name,
    required String courseCode,
    required String courseName,
    required String description,
    required String creatorName,
    required int memberCount,
    required bool isMember,
  }) = _StudyGroup;

  factory StudyGroup.fromSeed(Map<String, dynamic> seed) => StudyGroup(
    id: seed['id'] as String,
    name: seed['name'] as String,
    courseCode: seed['courseCode'] as String,
    courseName: seed['courseName'] as String,
    description: seed['description'] as String,
    creatorName: seed['creatorName'] as String,
    memberCount: seed['memberCount'] as int,
    isMember: seed['isMember'] as bool,
  );
}
