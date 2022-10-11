import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.onChanged,
    required this.value,
  });

  final Function(String?) onChanged;
  final String value;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: const Text(
          AppStrings.taskTitleHintText,
          style: TextStyle(
            color: AppColors.white38,
          ),
        ),
        fillColor: AppColors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(
            color: AppColors.white38,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(
            color: AppColors.white38,
          ),
        ),
      ),
      style: const TextStyle(
        color: AppColors.white,
      ),
      onChanged: onChanged,
      initialValue: value,
      validator: (value) {
        if (value!.isEmpty) {
          return AppStrings.taskTitleIsEmptyError;
        }
        return null;
      },
    );
  }
}
