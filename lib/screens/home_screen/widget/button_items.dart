import 'package:flutter/material.dart';
import 'package:home_tasks/utils/project_extensions.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/styles/app_text_style.dart';

class ButtonItems extends StatelessWidget {
  const ButtonItems({super.key, required this.title, required this.imagePath});

  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Container(
            height: 76.h(),
            width: 76.w(),
            decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.c_DBE3F8),
            child: IconButton(
              onPressed: (){},
              icon: SvgPicture.asset(imagePath),
            ),
          ),
          19.getH(),
          Text(title, style: AppTextStyle.poppinsRegular.copyWith(fontSize: 16),)

        ],
      );
  }
}
