import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/local/app_db.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_utils.dart';
import '../../view_models/tasks_view_model.dart';
import '../widgets/tasks_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.dark,
        appBar: AppBar(
          backgroundColor: AppColors.dark,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                AppStrings.appTitle,
                style: TextStyle(
                  color: AppColors.white,
                  fontFamily: AppStrings.dancingScriptFont,
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 10.0),
              Image.asset(
                AppStrings.logoImg,
                width: 42.0,
                height: 42.0,
              ),
            ],
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  '${AppStrings.currentTabBarTitle} (${context.select<TasksViewModel, int>((tasksViewModel) => tasksViewModel.currentTasks.length)})',
                  style: const TextStyle(
                    color: AppColors.white,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  '${AppStrings.completedTabBarTitle} (${context.select<TasksViewModel, int>((tasksViewModel) => tasksViewModel.completedTasks.length)})',
                  style: const TextStyle(
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TasksList(isCompletedTabBar: false),
            TasksList(isCompletedTabBar: true),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AppUtils.showBottomModalSheet(
              context,
              // Useless dummy data since we will add a new task anyway
              task: const Task(id: 0, title: '', isCompleted: false),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
