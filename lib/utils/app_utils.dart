import 'package:flutter/material.dart';

import '../models/local/app_db.dart';
import '../views/screens/task_screen.dart';

class AppUtils {
  static void showBottomModalSheet(
    BuildContext context, {
    required Task task,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: TaskScreen(task: task),
          ),
        );
      },
    );
  }
}
