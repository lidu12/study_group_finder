// State integration drafted with OpenAI Codex. Team review pending.
import '../../../core/mock_data/mock_seeds.dart';
import '../domain/study_group.dart';
import '../domain/groups_repository.dart';

class InMemoryGroupsRepository implements GroupsRepository {
  List<StudyGroup> _value = List.unmodifiable(
    MockSeeds.studyGroups.map(StudyGroup.fromSeed),
  );

  @override
  List<StudyGroup> read() => _value;

  @override
  void save(List<StudyGroup> value) {
    _value = List.unmodifiable(value);
  }
}
