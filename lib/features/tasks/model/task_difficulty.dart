enum TaskDifficulty {
  veryEasy(0),
  easy(1),
  medium(2),
  hard(3),
  veryHard(4);

  final int value;
  const TaskDifficulty(this.value);

  static TaskDifficulty fromValue(int value) {
    return TaskDifficulty.values.firstWhere(
          (e) => e.value == value,
      orElse: () => TaskDifficulty.medium, // fallback default
    );
  }

  String get label {
    switch (this) {
      case TaskDifficulty.veryEasy:
        return 'Very Easy';
      case TaskDifficulty.easy:
        return 'Easy';
      case TaskDifficulty.medium:
        return 'Medium';
      case TaskDifficulty.hard:
        return 'Hard';
      case TaskDifficulty.veryHard:
        return 'Very Hard';
    }
  }
}
