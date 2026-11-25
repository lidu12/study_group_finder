# AI Usage Disclosure – Study Group Finder

**Course / Project:** Study Group Finder  
**Target Milestone:** Milestone 1  
**Date:** November 2026  
**Group:** Lidiya Aramde, Ruth Zelalem, Tesnim Hussien, Tsion Bizuayehu  

---

## 1. Compliance Statement

In accordance with Section 12 of `PROPOSAL.md` and the course AI Policy, this document discloses and details how artificial intelligence tools were utilized during the development of Milestone 1.

All AI-suggested code, structures, and documentation were carefully inspected, understood, tested, and integrated by the team members. No sensitive university credentials, API keys, or private data were submitted to AI models.

---

## 2. Tools & Models Used

- **Google DeepMind Antigravity / Gemini CLI:** Assisted with architectural project scaffolding, Flutter 3.27+ API deprecation migration, and drafting unit test structures.

---

## 3. Scope of AI Usage

| Category | Description of Usage | Human Verification |
|---|---|---|
| **Architecture & Structure** | Guided the setup of a clean **feature-first** modular layout (`lib/features/{auth,groups,planner,profile,sessions}`) and Riverpod state management. | The team verified that directory structure aligns with course specifications. |
| **Flutter 3.27+ Deprecations** | Assisted in upgrading deprecated methods (e.g. replacing `.withOpacity()` with `.withValues(alpha: ...)`, `CardTheme` with `CardThemeData`, and `DropdownButtonFormField.value` with `initialValue`). | Code verified by running `flutter analyze --fatal-infos` with 0 warnings. |
| **Unit & Widget Testing** | Assisted in generating mock seeds for Addis Ababa University courses, groups, and testing Riverpod `AsyncNotifier` async state. | All tests executed with `flutter test` and verified passing. |
| **Documentation & Guides** | Assisted in formatting beginner-friendly Git instructions and Markdown summaries for team coordination. | Reviewed by group coordinator Lidiya Aramde. |

---

## 4. Individual Member Declarations

- **Lidiya Aramde (`lidu12` - Coordinator):**  
  *"I utilized AI assistance to establish the GoRouter navigation shell with persistent bottom navigation tabs, configure the Riverpod AI Study Planner architecture, and format Git collaboration guides for my teammates."*

- **Tesnim Hussien (`temihuss`):**  
  *"I used AI assistance to understand Flutter Form validation best practices, implement the AAU student ID and course selection chips, and configure interactive time slot pickers in the profile screen."*

- **Ruth Zelalem (`ruthzelalem65-dotcom`):**  
  *"I used AI assistance to learn how to implement real-time text searching and course filter chips in Flutter, as well as designing modal bottom sheets for study group details."*

- **Tsion Bizuayehu (`tsion875`):**  
  *"I used AI assistance to explore date and time pickers for session scheduling, simulate Addis Ababa University GPS coordinates, and manage attendee RSVP toggles."*

