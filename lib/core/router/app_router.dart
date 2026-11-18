import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/screens/login_registration_screen.dart';
import '../../features/groups/presentation/screens/find_groups_screen.dart';
import '../../features/groups/presentation/screens/home_screen.dart';
import '../../features/planner/presentation/screens/ai_planner_screen.dart';
import '../../features/profile/presentation/screens/profile_courses_screen.dart';
import '../../features/sessions/presentation/screens/create_session_screen.dart';
import '../../features/sessions/presentation/screens/session_details_screen.dart';
import '../widgets/scaffold_with_navbar.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: [
    // Standalone Auth Screen (outside the shell)
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginRegistrationScreen(),
    ),

    // Stateful Navigation Shell (Bottom Navigation Bar)
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: [
        // Tab 1: Home
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),

        // Tab 2: Find Groups
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/find-groups',
              builder: (context, state) => const FindGroupsScreen(),
            ),
          ],
        ),

        // Tab 3: AI Study Planner
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/planner',
              builder: (context, state) => const AiPlannerScreen(),
            ),
          ],
        ),

        // Tab 4: Profile & Courses
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfileCoursesScreen(),
            ),
          ],
        ),
      ],
    ),

    // Secondary Fullscreen Routes
    GoRoute(
      path: '/sessions/create',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const CreateSessionScreen(),
    ),
    GoRoute(
      path: '/sessions/:id',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final sessionId = state.pathParameters['id'] ?? 'sess_001';
        return SessionDetailsScreen(sessionId: sessionId);
      },
    ),
  ],
);

