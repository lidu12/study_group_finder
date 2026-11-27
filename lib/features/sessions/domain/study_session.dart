import 'package:freezed_annotation/freezed_annotation.dart';

part 'study_session.freezed.dart';

// Drafted with OpenAI Codex. Team review pending.
@freezed
abstract class StudySession with _$StudySession {
  const factory StudySession({
    required String id,
    required String courseCode,
    required String topic,
    required String date,
    required String startTime,
    required String endTime,
    required String meetingPlace,
    required String organizerName,
    required List<String> memberNames,
    required bool isJoined,
    double? latitude,
    double? longitude,
    int? maxParticipants,
  }) = _StudySession;

  factory StudySession.fromSeed(Map<String, dynamic> seed) => StudySession(
    id: seed['id'] as String,
    courseCode: seed['courseCode'] as String,
    topic: seed['topic'] as String,
    date: seed['date'] as String,
    startTime: seed['startTime'] as String,
    endTime: seed['endTime'] as String,
    meetingPlace: seed['meetingPlace'] as String,
    organizerName: seed['organizerName'] as String,
    memberNames: List<String>.from(seed['memberNames'] as List),
    isJoined: seed['isJoined'] as bool,
    latitude: seed['latitude'] as double?,
    longitude: seed['longitude'] as double?,
    maxParticipants: seed['maxParticipants'] as int?,
  );
}
