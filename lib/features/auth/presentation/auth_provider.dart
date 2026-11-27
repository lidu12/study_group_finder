import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/in_memory_auth_repository.dart';
import '../domain/demo_sign_in.dart';
import '../domain/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => InMemoryAuthRepository(),
);

final authProvider = StateNotifierProvider<AuthController, DemoSignIn?>(
  (ref) => AuthController(ref.watch(authRepositoryProvider)),
);

// Drafted with OpenAI Codex. Team review pending.
class AuthController extends StateNotifier<DemoSignIn?> {
  AuthController(this._repository) : super(_repository.read());

  final AuthRepository _repository;

  void _save(DemoSignIn? value) {
    _repository.save(value);
    state = _repository.read();
  }

  void signIn(String email) => _save(DemoSignIn(email: email));

  void signOut() => _save(null);
}
