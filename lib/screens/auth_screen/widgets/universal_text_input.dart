import 'package:flutter/material.dart';
import 'package:home_tasks/utils/project_extensions.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';

class UniversalTextInput extends StatelessWidget {
  const UniversalTextInput({super.key, required this.controller, required this.hintText, required this.type, required this.regExp, required this.errorTitle, required this.title});

  final String title;
  final TextEditingController controller;
  final String hintText;
  final TextInputType type;
  final RegExp regExp;
  final String errorTitle;

  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyle.rubikSemiBold.copyWith(fontSize: 18.w()),),
          8.getH(),
          TextFormField(
          controller: controller,
          keyboardType: type,
          validator: (String? value){if (value==null || value.isEmpty||value.length<3|| !regExp.hasMatch(value)){
            return "Enter true $errorTitle";
          }
          return null;},
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration:
          InputDecoration(
              contentPadding: const EdgeInsets.all(16),
              hintText: hintText,
              hintStyle: AppTextStyle.rubikRegular.copyWith(color: AppColors.white, fontSize: 16),
              enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(4)),
              disabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(4)),
              focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(4)),
              errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(4)),

          ),
          textInputAction: TextInputAction.next,
              ),
        ],
      );
  }
}
