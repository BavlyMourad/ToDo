import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../models/local/app_db.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_utils.dart';
import '../../view_models/tasks_view_model.dart';
import 'task_list_tile.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 14.0,
        vertical: 10.0,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => AppUtils.showBottomModalSheet(
                context,
                task: task,
              ),
              backgroundColor: AppColors.green400,
              foregroundColor: AppColors.white,
              icon: Icons.edit,
              label: AppStrings.editButtonTitle,
            ),
            SlidableAction(
              onPressed: (context) {
                context.read<TasksViewModel>().deleteTask(task.id);
              },
              backgroundColor: AppColors.red400,
              foregroundColor: AppColors.white,
              icon: Icons.delete,
              label: AppStrings.deleteButtonTitle,
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            context.read<TasksViewModel>().editTask(
                  TasksCompanion(
                    id: drift.Value(task.id),
                    title: drift.Value(task.title),
                    isCompleted: drift.Value(!task.isCompleted),
                  ),
                );
          },
          child: Container(
            color: AppColors.lightDark,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TaskListTile(
                  taskTitle: task.title,
                  isCompleted: task.isCompleted,
                  onChanged: (newValue) {
                    context.read<TasksViewModel>().editTask(
                          TasksCompanion(
                            id: drift.Value(task.id),
                            title: drift.Value(task.title),
                            isCompleted: drift.Value(!task.isCompleted),
                          ),
                        );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
