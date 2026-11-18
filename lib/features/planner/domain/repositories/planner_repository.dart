import '../models/study_plan.dart';

abstract class PlannerRepository {
  Future<StudyPlan> generateStudyPlan({
    required String topic,
    required double hours,
    required String goal,
  });

  Future<List<StudyPlan>> getSavedPlans();
}

