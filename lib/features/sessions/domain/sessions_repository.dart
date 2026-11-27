import 'study_session.dart';

abstract interface class SessionsRepository {
  List<StudySession> read();
  void save(List<StudySession> value);
}
