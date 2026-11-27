import 'package:freezed_annotation/freezed_annotation.dart';

part 'demo_sign_in.freezed.dart';

// Drafted with OpenAI Codex. Team review pending.
@freezed
abstract class DemoSignIn with _$DemoSignIn {
  const factory DemoSignIn({required String email}) = _DemoSignIn;
}
