# Milestone 1 Report – Study Group Finder

**Project Title:** Study Group Finder
**Target Milestone:** Milestone 1 (End of Week 6: Screens, Navigation, and In-Memory State)
**Submission Deadline:** Friday 27 November 2026 at 23:59
**Repository:** [https://github.com/lidu12/study-group-finder](https://github.com/lidu12/study-group-finder)

---

## 1. What is Done and What is Not

### What is Done:
- **Feature-First Architecture:** Each of the five features has domain, data, and presentation layers under `lib/features/`. Shared routing, styling, and sample data are under `lib/core/`.
- **All 7 Proposed Screens Built & Navigable via GoRouter:**
  1. `LoginRegistrationScreen` (`/login`): AAU student email validation, password check, department and study year selection.
  2. `HomeScreen` (`/home`): Tab 1 of persistent navigation shell with my groups and upcoming sessions.
  3. `FindGroupsScreen` (`/find-groups`): Tab 2 with live text search, course code chips filter, group cards, and details modal.
  4. `AiPlannerScreen` (`/planner`): Tab 3 with topic, time, and goal inputs generating hourly study plans.
  5. `ProfileCoursesScreen` (`/profile`): Tab 4 with AAU student ID (`UGR/2799/16`), course enrollment chips, and interactive weekly availability slots.
  6. `CreateSessionScreen` (`/sessions/create`): Sub-route with course selector, topic, date/time pickers, max attendees, and AAU Campus GPS simulator (`9.0353° N, 38.7628° E`).
  7. `SessionDetailsScreen` (`/sessions/:id`): Parameterized detail route displaying session logistics, attendee roster, and interactive RSVP Join/Leave toggle.
- **State in Riverpod Providers:** Auth, profile, groups, sessions, and the planner use provider-backed in-memory repositories behind interfaces and Freezed models.
  - Home and Session Details share session creation and RSVP updates. Home and Find Groups share group membership.
  - Profile course selections and saved availability are managed by the profile provider. Registration updates the in-memory demo profile, and sign-in and sign-out update demo auth state.
  - Widgets keep temporary UI inputs such as text fields, picker selections, and search text.
- **Automated Tests:** 11 unit and widget tests covering navigation, the planner, session creation and RSVP, group membership, profile courses, and demo sign-in.
- **Zero Analyzer Errors:** Passed `flutter analyze --fatal-infos` with no issues.
- **Clean Git Repository Hygiene:** Branching model with 4 merged feature pull requests, descriptive commit messages, with formal approvals verified on PRs #1 and #3.

### What Is Still Open
- Sign-in is a local demo. Account verification and storing student data across restarts are planned for Milestone 2.
- **Live Backend & Cloud Services:** Integration with FastAPI REST backend service and Google Gemini API (scheduled for Milestone 2).
- **Persistent Storage:** Cloud Firestore and local persistence via `SharedPreferences` (scheduled for Milestone 2).
- **Live Device GPS Sensors:** Replacing the simulated campus location with the `geolocator` device sensor package (scheduled for Milestone 2).

---

## 2. Pull Requests Authored and Reviewed per Member

| Member Name | Student ID | GitHub Username | Pull Request Authored | Pull Request Reviewed |
|---|---|---|---|---|
| **Lidiya Aramde** (Coordinator) | UGR/7616/16 | `lidu12` | **[PR #1](https://github.com/lidu12/study-group-finder/pull/1):** `feature/core-and-ai-planner`<br>*(Core architecture, GoRouter shell, theme, Riverpod planner and tests)* | **[PR #4](https://github.com/lidu12/study-group-finder/pull/4):** Authored by Tesnim Hussien (`feature/auth-profile`) |
| **Tesnim Hussien** | UGR/2799/16 | `temihuss` | **[PR #4](https://github.com/lidu12/study-group-finder/pull/4):** `feature/auth-profile`<br>*(Form validation, AAU student ID profile, course enrollment chips, availability slots)* | **[PR #3](https://github.com/lidu12/study-group-finder/pull/3):** Authored by Ruth Zelalem (`feature/groups-discovery`) |
| **Ruth Zelalem** | UGR/7254/16 | `ruthzelalem65-dotcom` | **[PR #3](https://github.com/lidu12/study-group-finder/pull/3):** `feature/groups-discovery`<br>*(Groups discovery, real-time search, course code filter chips, group details modal)* | **[PR #2](https://github.com/lidu12/study-group-finder/pull/2):** Authored by Tsion Bizuayehu (`feature/sessions-home`) |
| **Tsion Bizuayehu** | UGR/6511/16 | `tsion875` | **[PR #2](https://github.com/lidu12/study-group-finder/pull/2):** `feature/sessions-home`<br>*(Home dashboard, session creation with AAU location, parameterized `/sessions/:id` with RSVP)* | **[PR #1](https://github.com/lidu12/study-group-finder/pull/1):** Authored by Lidiya Aramde (`feature/core-and-ai-planner`) |

---

Lidiya reports reviewing PR #4 on GitHub, checking auth validation and the profile and availability screens. Ruth reports reviewing PR #2 on GitHub. GitHub records both merges. Formal review records were verified for PRs #1 and #3.

## 3. Group's Self-Score Against the Marking List

| Marking Item | Max Points | Self-Score | One-Sentence Evidence |
|---|:---:|:---:|---|
| **All proposed screens present and navigable** | 3 | **3 / 3** | All 7 screens from Section 6 of our proposal exist and are reachable via `go_router` through bottom navigation tabs and parameterized detail routes (`/sessions/:id`). |
| **Feature-first structure; state in providers, not widgets** | 2 | **2 / 2** | The five features have domain, data, and presentation layers, with shared app state in Riverpod and Freezed models backed by in-memory repositories. |
| **Tests present; analyzer and tests clean in pasted output** | 1 | **1 / 1** | The test suite contains 11 passing unit and widget tests, and `flutter analyze --fatal-infos` completes with zero issues. |
| **Repository hygiene: branches, pull requests, readable history** | 1 | **0.75 / 1** | Four feature PRs were merged with descriptive commits, and two formal approvals were verified. |
| **Individual oral check, recorded per member** | 3 | **Pending** | The instructor will record each oral check during the lab. |
| **Total** | **10** | **6.75 / 7** | The three oral-check points are pending. |

---

## 4. One Thing Our Group Will Change Before Milestone 2

Before integrating live services, we will add regression tests that exercise session creation and RSVP through the screens so that the same behaviour is verified when a live repository replaces the in-memory implementation.

---

## 5. Analyzer and Test Output

These commands passed on the local milestone revision. The published `m1` tag still points to the earlier commit. Verify both commands on the final commit used for submission.

### `flutter analyze --fatal-infos`

```text
Analyzing study_group_finder...
No issues found! (ran in 4.2s)
```

### `flutter test`

```text
00:00 +0: loading C:/Users/Hp/Downloads/study_group_finder/test/features/planner/planner_controller_test.dart
00:00 +0: C:/Users/Hp/Downloads/study_group_finder/test/features/planner/planner_controller_test.dart: PlannerController Riverpod Tests initial state is null data
00:00 +1: C:/Users/Hp/Downloads/study_group_finder/test/features/planner/planner_repository_test.dart: InMemoryPlannerRepository Tests generateStudyPlan creates a structured plan for 1 hour
00:00 +2: C:/Users/Hp/Downloads/study_group_finder/test/features/planner/planner_repository_test.dart: InMemoryPlannerRepository Tests generateStudyPlan creates a structured plan for 1 hour
00:00 +3: C:/Users/Hp/Downloads/study_group_finder/test/features/planner/planner_repository_test.dart: InMemoryPlannerRepository Tests generateStudyPlan creates a structured plan for 1 hour
00:00 +4: C:/Users/Hp/Downloads/study_group_finder/test/features/planner/planner_repository_test.dart: InMemoryPlannerRepository Tests generateStudyPlan creates a structured plan for 1 hour
00:00 +5: C:/Users/Hp/Downloads/study_group_finder/test/features/planner/planner_controller_test.dart: PlannerController Riverpod Tests generatePlan transitions from loading to populated plan
00:00 +6: C:/Users/Hp/Downloads/study_group_finder/test/widget_test.dart: App launches on Home screen and navigation tabs exist
00:01 +7: C:/Users/Hp/Downloads/study_group_finder/test/widget_test.dart: App launches on Home screen and navigation tabs exist
00:01 +8: C:/Users/Hp/Downloads/study_group_finder/test/widget_test.dart: App launches on Home screen and navigation tabs exist
00:01 +9: C:/Users/Hp/Downloads/study_group_finder/test/widget_test.dart: App launches on Home screen and navigation tabs exist
00:02 +10: C:/Users/Hp/Downloads/study_group_finder/test/widget_test.dart: Navigation switches tabs to AI Planner and Find Groups
00:03 +11: All tests passed!
```
