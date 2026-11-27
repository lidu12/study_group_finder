import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/in_memory_profile_repository.dart';
import '../domain/student_profile.dart';
import '../domain/profile_repository.dart';

final profileRepositoryProvider = Provider<ProfileRepository>(
  (ref) => InMemoryProfileRepository(),
);

final profileProvider =
    StateNotifierProvider<ProfileController, StudentProfile>(
      (ref) => ProfileController(ref.watch(profileRepositoryProvider)),
    );

// Drafted with OpenAI Codex. Team review pending.
class ProfileController extends StateNotifier<StudentProfile> {
  ProfileController(this._repository) : super(_repository.read());

  final ProfileRepository _repository;

  void _save(StudentProfile value) {
    _repository.save(value);
    state = _repository.read();
  }

  void updateIdentity({
    required String name,
    required String email,
    required String studentId,
    required String department,
    required int yearOfStudy,
  }) {
    _save(
      state.copyWith(
        name: name,
        email: email,
        studentId: studentId,
        department: department,
        yearOfStudy: yearOfStudy,
      ),
    );
  }

  void toggleCourse(String id) {
    final courses = {...state.enrolledCourseIds};
    if (!courses.remove(id)) courses.add(id);
    _save(state.copyWith(enrolledCourseIds: courses));
  }

  void addAvailability(AvailabilitySlot slot) {
    _save(state.copyWith(availability: [...state.availability, slot]));
  }

  void removeAvailability(int index) {
    final slots = [...state.availability]..removeAt(index);
    _save(state.copyWith(availability: slots));
  }
}
