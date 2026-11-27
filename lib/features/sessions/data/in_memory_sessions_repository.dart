// State integration drafted with OpenAI Codex. Team review pending.
import '../../../core/mock_data/mock_seeds.dart';
import '../domain/study_session.dart';
import '../domain/sessions_repository.dart';

class InMemorySessionsRepository implements SessionsRepository {
  List<StudySession> _value = List.unmodifiable(
    MockSeeds.studySessions.map(StudySession.fromSeed),
  );

  @override
  List<StudySession> read() => _value;

  @override
  void save(List<StudySession> value) {
    _value = List.unmodifiable(value);
  }
}
