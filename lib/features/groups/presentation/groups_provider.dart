import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/in_memory_groups_repository.dart';
import '../domain/study_group.dart';
import '../domain/groups_repository.dart';

final groupsRepositoryProvider = Provider<GroupsRepository>(
  (ref) => InMemoryGroupsRepository(),
);

final groupsProvider =
    StateNotifierProvider<GroupsController, List<StudyGroup>>(
      (ref) => GroupsController(ref.watch(groupsRepositoryProvider)),
    );

// Drafted with OpenAI Codex. Team review pending.
class GroupsController extends StateNotifier<List<StudyGroup>> {
  GroupsController(this._repository) : super(_repository.read());

  final GroupsRepository _repository;

  void _save(List<StudyGroup> value) {
    _repository.save(value);
    state = _repository.read();
  }

  void add(StudyGroup group) => _save([group, ...state]);

  void toggleMembership(String id) {
    _save([
      for (final group in state)
        if (group.id == id)
          group.copyWith(
            isMember: !group.isMember,
            memberCount: group.memberCount + (group.isMember ? -1 : 1),
          )
        else
          group,
    ]);
  }
}
