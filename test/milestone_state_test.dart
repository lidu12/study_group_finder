import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_group_finder/features/auth/presentation/auth_provider.dart';
import 'package:study_group_finder/features/groups/presentation/groups_provider.dart';
import 'package:study_group_finder/features/profile/presentation/profile_provider.dart';
import 'package:study_group_finder/features/sessions/presentation/sessions_provider.dart';

// Drafted with OpenAI Codex. Team review pending.
void main() {
  test('session creation and RSVP are shared across provider reads', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final controller = container.read(sessionsProvider.notifier);
    final sample = container.read(sessionsProvider).first;
    final name = container.read(profileProvider).name;
    final session = sample.copyWith(
      id: 'new-session',
      isJoined: false,
      memberNames: const [],
      maxParticipants: 1,
    );
    controller.add(session);
    expect(container.read(sessionsProvider).first.id, session.id);

    controller.toggleRsvp(session.id, name);
    expect(container.read(sessionsProvider).first.isJoined, isTrue);
    expect(container.read(sessionsProvider).first.memberNames, [name]);

    controller.toggleRsvp(session.id, 'Updated profile name');
    expect(container.read(sessionsProvider).first.isJoined, isFalse);
    expect(container.read(sessionsProvider).first.memberNames, isEmpty);
  });

  test('group membership updates its count and leaves seeds intact', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final group = container.read(groupsProvider).first;
    container.read(groupsProvider.notifier).toggleMembership(group.id);
    final updated = container.read(groupsProvider).first;
    expect(updated.isMember, isFalse);
    expect(updated.memberCount, group.memberCount - 1);

    final anotherContainer = ProviderContainer();
    addTearDown(anotherContainer.dispose);
    expect(anotherContainer.read(groupsProvider).first, group);
  });

  test('profile course changes and demo sign-in stay in provider memory', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final course = container.read(profileProvider).enrolledCourseIds.first;
    container.read(profileProvider.notifier).toggleCourse(course);
    expect(
      container.read(profileProvider).enrolledCourseIds,
      isNot(contains(course)),
    );

    final auth = container.read(authProvider.notifier);
    auth.signIn('demo@aau.edu.et');
    expect(container.read(authProvider)?.email, 'demo@aau.edu.et');
    auth.signOut();
    expect(container.read(authProvider), isNull);
  });
}
