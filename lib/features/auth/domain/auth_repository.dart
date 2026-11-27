import 'demo_sign_in.dart';

abstract interface class AuthRepository {
  DemoSignIn? read();
  void save(DemoSignIn? value);
}
