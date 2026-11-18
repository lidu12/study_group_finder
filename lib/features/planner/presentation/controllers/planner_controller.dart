import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/in_memory/in_memory_planner_repository.dart';
import '../../domain/models/study_plan.dart';
import '../../domain/repositories/planner_repository.dart';

// Provider for the abstract repository
final plannerRepositoryProvider = Provider<PlannerRepository>((ref) {
  return InMemoryPlannerRepository();
});

// StateNotifier for generating and caching the active study plan
class PlannerController extends StateNotifier<AsyncValue<StudyPlan?>> {
  PlannerController(this._repository) : super(const AsyncValue.data(null));

  final PlannerRepository _repository;

  Future<void> generatePlan({
    required String topic,
    required double hours,
    required String goal,
  }) async {
    state = const AsyncValue.loading();
    try {
      final plan = await _repository.generateStudyPlan(
        topic: topic,
        hours: hours,
        goal: goal,
      );
      state = AsyncValue.data(plan);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void reset() {
    state = const AsyncValue.data(null);
  }
}

// Controller Provider
final plannerControllerProvider =
    StateNotifierProvider<PlannerController, AsyncValue<StudyPlan?>>((ref) {
  final repository = ref.watch(plannerRepositoryProvider);
  return PlannerController(repository);
});

