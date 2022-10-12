import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_strings.dart';

import '../../view_models/tasks_view_model.dart';
import 'task_card.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key, required this.isCompletedTabBar});

  final bool isCompletedTabBar;

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksViewModel>(
      builder: (context, tasksViewModel, child) {
        final currentTasks = tasksViewModel.currentTasks;
        final completedTasks = tasksViewModel.completedTasks;

        // Check tab bars and if tasks are not empty
        if (!isCompletedTabBar && currentTasks.isNotEmpty) {
          return ListView.builder(
            itemCount: currentTasks.length,
            itemBuilder: (context, index) {
              return TaskCard(
                task: currentTasks[index],
              );
            },
          );
        } else if (isCompletedTabBar && completedTasks.isNotEmpty) {
          return ListView.builder(
            itemCount: completedTasks.length,
            itemBuilder: (context, index) {
              return TaskCard(
                task: completedTasks[index],
              );
            },
          );
        } else {
          return const Center(
            child: Text(
              AppStrings.emptyTasksText,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 18.0,
              ),
            ),
          );
        }
      },
    );
  }
}
