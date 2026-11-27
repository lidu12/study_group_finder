import 'study_group.dart';

abstract interface class GroupsRepository {
  List<StudyGroup> read();
  void save(List<StudyGroup> value);
}
