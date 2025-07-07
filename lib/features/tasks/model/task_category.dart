enum TaskCategory {
  work('Work'),
  study('Study'),
  personal('Personal'),
  health('Health'),
  family('Family'),
  freeTime('Free time'),
  other('Other');

  final String label;
  const TaskCategory(this.label);

  static TaskCategory fromLabel(String label) {
    return TaskCategory.values.firstWhere(
          (e) => e.label.toLowerCase() == label.toLowerCase(),
      orElse: () => TaskCategory.other,
    );
  }
}
