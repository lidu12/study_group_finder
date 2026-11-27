import 'student_profile.dart';

abstract interface class ProfileRepository {
  StudentProfile read();
  void save(StudentProfile value);
}
