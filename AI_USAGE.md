# AI usage disclosure

Study Group Finder, Milestone 1

## Tools used

| Tool | Version / model | Used for |
|---|---|---|
| Antigravity | Gemini | Assisted with Flutter architecture boilerplate, planner structure, and test examples |
| ChatGPT and Claude | Web assistants (Tesnim, Ruth, Tsion) | Explaining Flutter widgets, form validation, search filters, and date/time picker patterns |
| OpenAI Codex | Codex | Reviewing the milestone report and drafting the shared Riverpod and Freezed changes and regression tests |

## What was generated and where

| File / function | Member | AI-use level | What the tool helped with | What we wrote and changed | How we verified it |
|---|---|---|---|---|---|
| `lib/core/`, `lib/features/planner/` | Lidiya | 2–3 (Boilerplate & verify) | Initial GoRouter shell and planner state structure | Configured all 7 proposal routes, theme colors, `MockSeeds`, and fixed deprecated APIs (`CardThemeData`, `withValues`, `initialValue`) | Lidiya ran `flutter analyze --fatal-infos` and `flutter test` on the original milestone code |
| `test/widget_test.dart`, `test/features/planner/` | Lidiya | 2 (Examples & adapt) | Example widget and unit test structure | Wrote assertions for Home/Planner/Find Groups navigation and `PlannerController`, added `ProviderScope`, and fixed initial-state assertion | Lidiya ran the original 8 tests locally and all passed |
| `login_registration_screen.dart`, `profile_courses_screen.dart` | Tesnim | 2 (Patterns & adapt) | `Form` validation and `showTimePicker` bottom sheet examples | Implemented AAU email/ID (`UGR/2799/16`) validation, department/year dropdowns, course chips, and weekly availability UI | Ran `flutter test` locally and reviewed via PR #4 |
| `find_groups_screen.dart` | Ruth | 2 (Patterns & adapt) | Search filtering and `ChoiceChip` layout examples | Connected real-time search, AAU course filters (`SEng3112`, `CS3101`), join/leave state, and create-group dialog | Ran `flutter test` locally and reviewed via PR #3 |
| `create_session_screen.dart`, `session_details_screen.dart` | Tsion | 2 (Patterns & adapt) | `showDatePicker`/`showTimePicker` and RSVP button examples | Built session creation, AAU 4 Kilo Campus GPS simulation (`9.0353° N, 38.7628° E`), and `/sessions/:id` RSVP roster | Ran `flutter test` locally and reviewed via PR #2 |
| `MILESTONE.md`, `AI_USAGE.md` | Lidiya | 1–2 (Audit & polish) | Audited report consistency against the tagged commit | Documented team contributions, PR review matrix, self-scores, and pasted actual analyzer/test outputs | Verified paths, git tags, and command outputs locally |
| New or changed model, repository, provider, and screen code under `lib/features/`, plus `test/milestone_state_test.dart` and Freezed dependencies | Lidiya | 3 (Draft and verify) | Codex drafted the shared Riverpod state, in-memory repositories, Freezed models, and regression tests | Human edits and review pending | The analyzer reported no issues and all 11 tests passed on the final tagged commit. Team rerun of the final version is pending. |

## Which tasks did we do without an assistant first?

- **Project & Proposal Design:** Defined the AAU Study Group Finder problem, potential user interview, 7 user stories, and 7-screen flow in `PROPOSAL.md`.
- **Repository & Team Workflow:** Created the GitHub repository, `project.yaml`, `proposal` tag, feature branches, Pull Requests, and peer reviews across all 4 members.
- **AAU Domain Data & Verification:** Defined realistic AAU course codes, student IDs, and 4 Kilo Campus meeting places in `MockSeeds`, and checked the original milestone code with `flutter analyze --fatal-infos` and `flutter test`. Team members also ran tests on their own branches.

## Problems found in AI output

- Lidiya caught and fixed deprecated Flutter 3.27+ APIs (`CardThemeData`, `withValues`, `initialValue`), added a missing `ProviderScope` in `widget_test.dart`, corrected the initial-state assertion in `planner_controller_test.dart`, and updated `MILESTONE.md` so it accurately describes our handwritten models and `StateNotifier` controller.
- Tesnim, Ruth, and Tsion reported none.

## Individual declaration

| Name | I wrote or reviewed and can explain these files | I entered no passwords, keys or personal data into an AI tool (yes / no) | Signature |
|---|---|---|---|
| Lidiya Aramde | `lib/main.dart`, `app_router.dart`, `scaffold_with_navbar.dart`, `lib/features/planner/`, `test/` | Yes | Lidiya Aramde |
| Tesnim Hussien | `login_registration_screen.dart`, `profile_courses_screen.dart` | Yes | Tesnim Hussien |
| Ruth Zelalem | `find_groups_screen.dart` | Yes | Ruth Zelalem |
| Tsion Bizuayehu | `create_session_screen.dart`, `session_details_screen.dart`, `home_screen.dart` | Yes | Tsion Bizuayehu |

Confirmations recorded on 27 November 2026.
