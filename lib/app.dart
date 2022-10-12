import 'package:flutter/material.dart';

import 'utils/app_colors.dart';
import 'utils/app_strings.dart';
import 'views/screens/home_screen.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: AppColors.primary,
        unselectedWidgetColor: AppColors.primary, // Checkbox border
      ),
      home: const HomeScreen(),
    );
  }
}
