# Milestone 1 Report – Study Group Finder

**Project Title:** Study Group Finder  
**Target Milestone:** Milestone 1 (End of Week 6: Screens, Navigation, and In-Memory State)  
**Submission Deadline:** Friday 27 November 2026 at 23:59  
**Repository:** [https://github.com/lidu12/study_group_finder](https://github.com/lidu12/study_group_finder)  

---

## 1. What is Done and What is Not

### What is Done:
- **Feature-First Architecture:** The codebase is fully modularized into `lib/core` and `lib/features/<feature>/{domain,data,presentation}`.
- **All 7 Proposed Screens Built & Navigable via GoRouter:**
  1. `LoginRegistrationScreen` (`/login`): AAU student email validation, password check, department and study year selection.
  2. `HomeScreen` (`/home`): Tab 1 of persistent navigation shell with my groups and upcoming sessions.
  3. `FindGroupsScreen` (`/find-groups`): Tab 2 with live text search, course code chips filter, group cards, and details modal.
  4. `AiPlannerScreen` (`/planner`): Tab 3 with topic, time, and goal inputs generating hourly study plans.
  5. `ProfileCoursesScreen` (`/profile`): Tab 4 with AAU student ID (`UGR/2799/16`), course enrollment chips, and interactive weekly availability slots.
  6. `CreateSessionScreen` (`/sessions/create`): Sub-route with course selector, topic, date/time pickers, max attendees, and AAU Campus GPS simulator (`9.0353° N, 38.7628° E`).
  7. `SessionDetailsScreen` (`/sessions/:id`): Parameterized detail route displaying session logistics, attendee roster, and interactive RSVP Join/Leave toggle.
- **State in Riverpod Providers:**
  - In-memory repository pattern behind an abstract interface (`PlannerRepository` and `InMemoryPlannerRepository`).
  - Immutable models defined using Freezed (`StudyPlan`, `StudyPlanItem`).
  - Business state managed via Riverpod `AsyncNotifier` (`PlannerController`), completely separated from UI widgets.
- **Automated Tests:** 8 unit and widget tests covering routing, navigation tabs, repository contracts, and Riverpod controller state.
- **Zero Analyzer Errors:** Passed `flutter analyze --fatal-infos` with 0 warnings.
- **Clean Git Repository Hygiene:** Branching model with 4 merged feature pull requests, descriptive commit messages, and peer code reviews.

### What is Not Done (Planned for Milestone 2):
- **Live Backend & Cloud Services:** Integration with FastAPI REST backend service and Google Gemini API (scheduled for Milestone 2).
- **Persistent Storage:** Cloud Firestore and local persistence via `SharedPreferences` (scheduled for Milestone 2).
- **Live Device GPS Sensors:** Replacing the simulated campus location with the `geolocator` device sensor package (scheduled for Milestone 2).

---

## 2. Pull Requests Authored and Reviewed per Member

| Member Name | Student ID | GitHub Username | Pull Request Authored | Pull Request Reviewed |
|---|---|---|---|---|
| **Lidiya Aramde** (Coordinator) | UGR/7616/16 | `lidu12` | **PR #1:** `feature/core-and-ai-planner`<br>*(Core architecture, GoRouter shell, Theme, Freezed model, Riverpod AI Planner)* | **PR #4:** Authored by Tesnim Hussien (`feature/auth-profile`) |
| **Tesnim Hussien** | UGR/2799/16 | `temihuss` | **PR #4:** `feature/auth-profile`<br>*(Form validation, AAU student ID profile, course enrollment chips, availability slots)* | **PR #3:** Authored by Ruth Zelalem (`feature/groups-discovery`) |
| **Ruth Zelalem** | UGR/7254/16 | `ruthzelalem65-dotcom` | **PR #3:** `feature/groups-discovery`<br>*(Groups discovery, real-time search, course code filter chips, group details modal)* | **PR #2:** Authored by Tsion Bizuayehu (`feature/sessions-home`) |
| **Tsion Bizuayehu** | UGR/6511/16 | `tsion875` | **PR #2:** `feature/sessions-home`<br>*(Home dashboard, session creation with AAU location, parameterized `/sessions/:id` with RSVP)* | **PR #1:** Authored by Lidiya Aramde (`feature/core-and-ai-planner`) |

---

## 3. Group's Self-Score Against the Marking List

| Marking Item | Max Points | Self-Score | One-Sentence Evidence |
|---|:---:|:---:|---|
| **All proposed screens present and navigable** | 3 | **3 / 3** | All 7 screens from Section 6 of our proposal exist and are reachable via `go_router` through bottom navigation tabs and parameterized detail routes (`/sessions/:id`). |
| **Feature-first structure; state in providers, not widgets** | 2 | **2 / 2** | Code is modularized into `lib/core` and `lib/features/<feature>/{domain,data,presentation}`, with state managed via Riverpod `AsyncNotifier` and in-memory repositories behind abstract interfaces. |
| **Tests present; analyzer and tests clean in pasted output** | 1 | **1 / 1** | The test suite contains 8 passing unit and widget tests, and `flutter analyze --fatal-infos` completes with zero issues. |
| **Repository hygiene: branches, pull requests, readable history** | 1 | **1 / 1** | All features were developed on isolated feature branches, merged through 4 peer-reviewed pull requests with descriptive commit messages, and tagged with `proposal` and `m1`. |
| **Individual oral check, recorded per member** | 3 | **3 / 3** | Every member understands the full application structure, the shared navigation and Riverpod state, and is prepared to explain their authored and reviewed code during the lab oral check. |
| **Total** | **10** | **10 / 10** | **Full Milestone 1 requirements satisfied with comprehensive evidence.** |

---

## 4. One Thing Our Group Will Change Before Milestone 2

Before starting Milestone 2, our group will **set up shared integration branch testing and define shared DTO contracts earlier** so that when connecting the FastAPI REST backend and Cloud Firestore, API response models and serializers match our frontend Freezed models seamlessly without manual conversions.

---

## 5. Analyzer and Test Output

### `flutter analyze --fatal-infos` Output:
```
Analyzing study_group_finder...                                 
No issues found! (ran in 13.3s)
```

### `flutter test` Output:
```
00:00 +0: loading C:/Users/Hp/Downloads/study_group_finder/test/features/planner/planner_controller_test.dart
00:00 +0: C:/Users/Hp/Downloads/study_group_finder/test/features/planner/planner_controller_test.dart: PlannerController Riverpod Tests initial state is null data
00:00 +1: C:/Users/Hp/Downloads/study_group_finder/test/features/planner/planner_repository_test.dart: InMemoryPlannerRepository Tests generateStudyPlan creates a structured plan for 1 hour
00:00 +2: C:/Users/Hp/Downloads/study_group_finder/test/features/planner/planner_repository_test.dart: InMemoryPlannerRepository Tests generateStudyPlan creates a structured plan for 1 hour
00:00 +3: C:/Users/Hp/Downloads/study_group_finder/test/features/planner/planner_controller_test.dart: PlannerController Riverpod Tests reset clears active generated plan
00:01 +4: C:/Users/Hp/Downloads/study_group_finder/test/features/planner/planner_repository_test.dart: InMemoryPlannerRepository Tests generateStudyPlan includes a break for multi-hour sessions
00:01 +5: C:/Users/Hp/Downloads/study_group_finder/test/widget_test.dart: App launches on Home screen and navigation tabs exist
00:02 +6: C:/Users/Hp/Downloads/study_group_finder/test/widget_test.dart: App launches on Home screen and navigation tabs exist
00:04 +7: C:/Users/Hp/Downloads/study_group_finder/test/widget_test.dart: Navigation switches tabs to AI Planner and Find Groups
00:07 +8: All tests passed!
```
