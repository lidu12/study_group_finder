// State integration drafted with OpenAI Codex. Team review pending.
import '../../../core/mock_data/mock_seeds.dart';
import '../domain/student_profile.dart';
import '../domain/profile_repository.dart';

class InMemoryProfileRepository implements ProfileRepository {
  StudentProfile _value = StudentProfile.fromSeed(MockSeeds.currentUser);

  @override
  StudentProfile read() => _value;

  @override
  void save(StudentProfile value) {
    _value = value;
  }
}
