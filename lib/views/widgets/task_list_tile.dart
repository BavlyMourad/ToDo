import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key,
    required this.taskTitle,
    required this.isCompleted,
    required this.onChanged,
  });

  final String taskTitle;
  final bool isCompleted;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: isCompleted,
        tristate: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        onChanged: onChanged,
      ),
      title: Text(
        taskTitle,
        style: TextStyle(
          color: AppColors.white,
          decoration: isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
    );
  }
}
