import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/in_memory_sessions_repository.dart';
import '../domain/study_session.dart';
import '../domain/sessions_repository.dart';

final sessionsRepositoryProvider = Provider<SessionsRepository>(
  (ref) => InMemorySessionsRepository(),
);

final sessionsProvider =
    StateNotifierProvider<SessionsController, List<StudySession>>(
      (ref) => SessionsController(ref.watch(sessionsRepositoryProvider)),
    );

// Drafted with OpenAI Codex. Team review pending.
class SessionsController extends StateNotifier<List<StudySession>> {
  SessionsController(this._repository) : super(_repository.read());

  final SessionsRepository _repository;

  void _save(List<StudySession> value) {
    _repository.save(value);
    state = _repository.read();
  }

  void add(StudySession session) => _save([session, ...state]);

  void toggleRsvp(String id, String attendeeName) {
    _save([
      for (final session in state)
        if (session.id == id) _toggle(session, attendeeName) else session,
    ]);
  }

  StudySession _toggle(StudySession session, String attendeeName) {
    final names = [...session.memberNames];
    // The demo attendee occupies the first slot when joined.
    if (session.isJoined) {
      if (names.isNotEmpty) names.removeAt(0);
    } else {
      if (session.maxParticipants case final limit?
          when names.length >= limit) {
        return session;
      }
      names.insert(0, attendeeName);
    }
    return session.copyWith(isJoined: !session.isJoined, memberNames: names);
  }
}
