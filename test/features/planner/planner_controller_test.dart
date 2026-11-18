import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_group_finder/features/planner/data/in_memory/in_memory_planner_repository.dart';
import 'package:study_group_finder/features/planner/domain/models/study_plan.dart';
import 'package:study_group_finder/features/planner/presentation/controllers/planner_controller.dart';

void main() {
  group('PlannerController Riverpod Tests', () {
    late InMemoryPlannerRepository repository;
    late PlannerController controller;

    setUp(() {
      repository = InMemoryPlannerRepository();
      controller = PlannerController(repository);
    });

    test('initial state is null data', () {
      expect(controller.state, equals(const AsyncValue<StudyPlan?>.data(null)));
      expect(controller.state.value, isNull);
    });

    test('generatePlan transitions from loading to populated plan', () async {
      final future = controller.generatePlan(
        topic: 'Database Normalization',
        hours: 2.0,
        goal: 'Exam Preparation',
      );

      // Awaiting completion
      await future;

      expect(controller.state.hasValue, isTrue);
      expect(controller.state.value, isNotNull);
      expect(controller.state.value!.topic, equals('Database Normalization'));
    });

    test('reset clears active generated plan', () async {
      await controller.generatePlan(
        topic: 'AI Agents',
        hours: 1.5,
        goal: 'Concept Mastery',
      );

      expect(controller.state.value, isNotNull);

      controller.reset();
      expect(controller.state.value, isNull);
    });
  });
}
