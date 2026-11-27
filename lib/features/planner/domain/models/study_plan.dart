import 'package:freezed_annotation/freezed_annotation.dart';

part 'study_plan.freezed.dart';

// Drafted with OpenAI Codex. Team review pending.
@Freezed(fromJson: false, toJson: false)
abstract class StudyPlanItem with _$StudyPlanItem {
  const StudyPlanItem._();

  const factory StudyPlanItem({
    required int order,
    required int durationMinutes,
    required String title,
    required String description,
    @Default(false) bool isBreak,
  }) = _StudyPlanItem;

  Map<String, dynamic> toJson() => {
    'order': order,
    'durationMinutes': durationMinutes,
    'title': title,
    'description': description,
    'isBreak': isBreak,
  };

  factory StudyPlanItem.fromJson(Map<String, dynamic> json) => StudyPlanItem(
    order: json['order'] as int,
    durationMinutes: json['durationMinutes'] as int,
    title: json['title'] as String,
    description: json['description'] as String,
    isBreak: json['isBreak'] as bool? ?? false,
  );
}

@freezed
abstract class StudyPlan with _$StudyPlan {
  const factory StudyPlan({
    required String id,
    required String topic,
    required double totalHours,
    required String goal,
    required List<StudyPlanItem> items,
    required DateTime createdAt,
  }) = _StudyPlan;
}
