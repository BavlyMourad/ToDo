import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/local/app_db.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../view_models/tasks_view_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({
    super.key,
    required this.task,
  });

  final Task task;

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _addOrEditTask(BuildContext context, String? newTaskTitle) {
    if (_formKey.currentState!.validate()) {
      final newTaskEntity = TasksCompanion(
        title: drift.Value(newTaskTitle!),
      );

      // It will return null if we didn't provide id and isCompleted
      // So we are using the incoming task data
      final updatedTaskEntity = TasksCompanion(
        id: drift.Value(task.id),
        title: drift.Value(newTaskTitle),
        isCompleted: drift.Value(task.isCompleted),
      );

      task.title.isEmpty
          ? context.read<TasksViewModel>().addTask(newTaskEntity)
          : context.read<TasksViewModel>().editTask(updatedTaskEntity);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;

    return Container(
      padding: const EdgeInsets.all(21.0),
      color: AppColors.grey,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title.isEmpty
                  ? AppStrings.addTaskTitle
                  : AppStrings.editTaskTitle,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 30.0,
              ),
            ),
            const SizedBox(height: 15.0),
            CustomTextFormField(
              onChanged: (value) {
                newTaskTitle = value;
              },
              value: task.title.isEmpty ? '' : task.title,
            ),
            const SizedBox(height: 30.0),
            CustomButton(
              onPressed: () => _addOrEditTask(context, newTaskTitle),
              title: task.title.isEmpty
                  ? AppStrings.addButtonTitle
                  : AppStrings.saveButtonTitle,
            ),
          ],
        ),
      ),
    );
  }
}
