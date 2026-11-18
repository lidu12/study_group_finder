import 'package:flutter_test/flutter_test.dart';
import 'package:study_group_finder/features/planner/data/in_memory/in_memory_planner_repository.dart';

void main() {
  group('InMemoryPlannerRepository Tests', () {
    late InMemoryPlannerRepository repository;

    setUp(() {
      repository = InMemoryPlannerRepository();
    });

    test('generateStudyPlan creates a structured plan for 1 hour', () async {
      final plan = await repository.generateStudyPlan(
        topic: 'Operating Systems Deadlocks',
        hours: 1.0,
        goal: 'Exam Preparation',
      );

      expect(plan.id, isNotEmpty);
      expect(plan.topic, equals('Operating Systems Deadlocks'));
      expect(plan.totalHours, equals(1.0));
      expect(plan.items.length, equals(3));
      expect(plan.items.first.title, contains('Core Concept'));
    });

    test('generateStudyPlan includes a break for multi-hour sessions', () async {
      final plan = await repository.generateStudyPlan(
        topic: 'Flutter Riverpod Patterns',
        hours: 3.5,
        goal: 'Lab Assignment',
      );

      expect(plan.totalHours, equals(3.5));
      expect(plan.items.length, greaterThanOrEqualTo(3));
      final hasBreak = plan.items.any((item) => item.isBreak);
      expect(hasBreak, isTrue);
    });

    test('saved plans list stores generated plans', () async {
      await repository.generateStudyPlan(
        topic: 'Architecture Review',
        hours: 2.0,
        goal: 'Group Discussion',
      );

      final saved = await repository.getSavedPlans();
      expect(saved.length, equals(1));
      expect(saved.first.topic, equals('Architecture Review'));
    });
  });
}

