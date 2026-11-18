import 'package:uuid/uuid.dart';
import '../../domain/models/study_plan.dart';
import '../../domain/repositories/planner_repository.dart';

class InMemoryPlannerRepository implements PlannerRepository {
  final List<StudyPlan> _savedPlans = [];
  final _uuid = const Uuid();

  @override
  Future<StudyPlan> generateStudyPlan({
    required String topic,
    required double hours,
    required String goal,
  }) async {
    // Simulate Gemini AI latency
    await Future.delayed(const Duration(milliseconds: 600));

    final totalMinutes = (hours * 60).toInt();
    final items = <StudyPlanItem>[];

    if (totalMinutes <= 60) {
      // 1 hour quick focus
      items.add(StudyPlanItem(
        order: 1,
        durationMinutes: 20,
        title: 'Core Concept Review: $topic',
        description: 'Read primary lecture notes and define essential terms and formulas.',
      ));
      items.add(StudyPlanItem(
        order: 2,
        durationMinutes: 30,
        title: 'Targeted Practice & $goal',
        description: 'Solve 2-3 focused problems directly related to $topic.',
      ));
      items.add(const StudyPlanItem(
        order: 3,
        durationMinutes: 10,
        title: 'Active Recall Summary',
        description: 'Close notes and write down key takeaways from memory.',
      ));
    } else {
      // Comprehensive multi-hour session
      final blockDuration = (totalMinutes * 0.35).toInt();
      final breakDuration = 15;
      final practiceDuration = (totalMinutes * 0.40).toInt();
      final reviewDuration = totalMinutes - blockDuration - breakDuration - practiceDuration;

      items.add(StudyPlanItem(
        order: 1,
        durationMinutes: blockDuration,
        title: 'Phase 1: Deep Dive & Fundamentals',
        description: 'Understand the core mechanisms of $topic and map out key concepts.',
      ));
      items.add(StudyPlanItem(
        order: 2,
        durationMinutes: breakDuration,
        title: 'Hydration & Campus Walk Break',
        description: 'Rest your eyes, step away from the screen, and recharge.',
        isBreak: true,
      ));
      items.add(StudyPlanItem(
        order: 3,
        durationMinutes: practiceDuration,
        title: 'Phase 2: $goal Application',
        description: 'Work through exam-style questions and group lab implementation tasks.',
      ));
      items.add(StudyPlanItem(
        order: 4,
        durationMinutes: reviewDuration > 0 ? reviewDuration : 15,
        title: 'Phase 3: Synthesis & Group Discussion',
        description: 'Prepare 3 quiz questions to test your study partners at the next session.',
      ));
    }

    final plan = StudyPlan(
      id: _uuid.v4(),
      topic: topic,
      totalHours: hours,
      goal: goal,
      items: items,
      createdAt: DateTime.now(),
    );

    _savedPlans.add(plan);
    return plan;
  }

  @override
  Future<List<StudyPlan>> getSavedPlans() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return List.unmodifiable(_savedPlans);
  }
}

