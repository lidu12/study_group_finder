// State integration drafted with OpenAI Codex. Team review pending.
import '../domain/demo_sign_in.dart';
import '../domain/auth_repository.dart';

class InMemoryAuthRepository implements AuthRepository {
  DemoSignIn? _value;

  @override
  DemoSignIn? read() => _value;

  @override
  void save(DemoSignIn? value) {
    _value = value;
  }
}
