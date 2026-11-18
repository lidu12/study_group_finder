class StudyPlanItem {
  final int order;
  final int durationMinutes;
  final String title;
  final String description;
  final bool isBreak;

  const StudyPlanItem({
    required this.order,
    required this.durationMinutes,
    required this.title,
    required this.description,
    this.isBreak = false,
  });

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

class StudyPlan {
  final String id;
  final String topic;
  final double totalHours;
  final String goal;
  final List<StudyPlanItem> items;
  final DateTime createdAt;

  const StudyPlan({
    required this.id,
    required this.topic,
    required this.totalHours,
    required this.goal,
    required this.items,
    required this.createdAt,
  });

  StudyPlan copyWith({
    String? id,
    String? topic,
    double? totalHours,
    String? goal,
    List<StudyPlanItem>? items,
    DateTime? createdAt,
  }) {
    return StudyPlan(
      id: id ?? this.id,
      topic: topic ?? this.topic,
      totalHours: totalHours ?? this.totalHours,
      goal: goal ?? this.goal,
      items: items ?? this.items,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

