# Milestone 1 Report – Study Group Finder

**Project Title:** Study Group Finder  
**Target Milestone:** Milestone 1 (End of Week 6: Screens, Navigation, and In-Memory State)  
**Submission Date:** November 2026  
**Repository:** [https://github.com/lidu12/study_group_finder](https://github.com/lidu12/study_group_finder)  

---

## 1. Group Members & Contributions

| Member Name | Student ID | GitHub Username | Role & Assigned PR | Reviewer Role |
|---|---|---|---|---|
| **Lidiya Aramde** (Coordinator) | UGR/7616/16 | `lidu12` | **PR #1:** Core Architecture, GoRouter Navigation Shell, Theme & AI Study Planner (`feature/core-and-ai-planner`) | Reviewed PR #2 |
| **Tesnim Hussien** | UGR/2799/16 | `temihuss` | **PR #2:** Form Validation, AAU Profile (`UGR/2799/16`), Course Selection & Availability Slots (`feature/auth-profile`) | Reviewed PR #3 |
| **Ruth Zelalem** | UGR/7254/16 | `ruthzelalem65-dotcom` | **PR #3:** Study Groups Discovery, Real-time Search, Course Filter Chips & Group Details Sheet (`feature/groups-discovery`) | Reviewed PR #4 |
| **Tsion Bizuayehu** | UGR/6511/16 | `tsion875` | **PR #4:** Home Dashboard, Study Session Creation with AAU GPS (`9.0353° N, 38.7628° E`) & RSVP Details (`feature/sessions-home`) | Reviewed PR #1 |

---

## 2. Milestone 1 Objectives & Completion Status

As specified in Section 11 of `PROPOSAL.md`, the objective of Milestone 1 is to implement all application screens, establish declarative navigation using `go_router`, set up Riverpod state management, define immutable data models, and demonstrate core user stories with in-memory sample data.

### User Stories Completed:
1. **Story 1 (Registration & Login - Must):** Completed in `lib/features/auth/`. Features AAU student email validation (`@aau.edu.et`), password security checks, department selection dropdown, year of study selector, and student profile initialization.
2. **Story 2 (Profile Setup & Courses - Must):** Completed in `lib/features/profile/`. Displays student credentials (`UGR/2799/16`), department, semester course enrollment toggle chips with counter, and interactive weekly availability slots with time pickers and deletion capabilities.
3. **Story 3 (Browse & Filter Groups - Must):** Completed in `lib/features/groups/`. Provides instant title and course code search, horizontal course filter chips, group cards with member counts and schedules, and interactive modal bottom sheet displaying group details and join status.
4. **Story 4 (Create Study Session - Must):** Completed in `lib/features/sessions/`. Provides a comprehensive creation form featuring course selector, topic/agenda input, date picker, time picker, max attendee limits, and an AAU 4 Kilo Campus GPS simulator (`9.0353° N, 38.7628° E`).
5. **Story 5 (Join / Leave Session - Must):** Completed in `lib/features/sessions/`. Route parameter `/sessions/:id` dynamically displays session logistics, organizer info, attendee roster, and interactive RSVP Join/Leave toggle that updates attendee counts in real-time.
6. **Story 6 (Upcoming Sessions - Should):** Completed on the Home screen (`lib/features/groups/presentation/screens/home_screen.dart`), presenting horizontal study group cards and upcoming session feeds with direct navigation.
7. **Story 7 (AI Study Planner - Should):** Completed in `lib/features/planner/`. Students input study topics, time availability, and learning objectives; the Riverpod `AsyncNotifier` controller simulates plan generation with structured hourly milestones.

---

## 3. Project Architecture

The application strictly follows a **feature-first** modular architecture:

```
lib/
├── core/
│   ├── constants/       # AppColors, AppTextStyles
│   ├── mock_data/       # MockSeeds (AAU courses, groups, sessions, user data)
│   ├── router/          # appRouter (GoRouter with StatefulShellRoute)
│   ├── theme/           # AppTheme (Material 3 with custom colors)
│   └── widgets/         # ScaffoldWithNavBar (Persistent 4-tab bottom navigation)
├── features/
│   ├── auth/            # Story 1: Login & Registration screens
│   ├── groups/          # Story 3 & 6: Home dashboard & Find Groups screen
│   ├── planner/         # Story 7: AI Study Planner (Domain, Data, Presentation)
│   ├── profile/         # Story 2: Profile, Courses & Availability screen
│   └── sessions/        # Story 4 & 5: Create Session & Session Details screens
└── main.dart            # Application entrypoint wrapped with ProviderScope
```

---

## 4. Verification & Testing

The project has been strictly verified against Flutter 3.27+ best practices:
- **Static Analysis:**
  ```bash
  flutter analyze --fatal-infos
  ```
  Result: **0 issues found!**
- **Automated Tests:**
  ```bash
  flutter test
  ```
  Result: **All 8 tests passed!** Tests cover bottom navigation tab switching, home screen rendering, AI planner repository contracts, and Riverpod `AsyncNotifier` controller state transitions.

---

## 5. How to Run the App

1. Ensure Flutter 3.x+ is installed.
2. In the project root, retrieve dependencies:
   ```bash
   flutter pub get
   ```
3. Run automated tests:
   ```bash
   flutter test
   ```
4. Launch the application on Chrome, Windows desktop, or a mobile emulator:
   ```bash
   flutter run
   ```
