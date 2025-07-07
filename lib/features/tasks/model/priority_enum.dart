enum TaskPriority {
  veryLow(0),
  low(1),
  medium(2),
  high(3),
  veryHigh(4);

  final int value;
  const TaskPriority(this.value);

  static TaskPriority fromValue(int value) {
    return TaskPriority.values.firstWhere(
          (e) => e.value == value,
      orElse: () => TaskPriority.medium,// I set it dèfault
    );
  }

  String get label {
    switch (this) {
      case TaskPriority.veryLow:
        return 'Very Low';
      case TaskPriority.low:
        return 'Low';
      case TaskPriority.medium:
        return 'Medium';
      case TaskPriority.high:
        return 'High';
      case TaskPriority.veryHigh:
        return 'Very High';
    }
  }
}
