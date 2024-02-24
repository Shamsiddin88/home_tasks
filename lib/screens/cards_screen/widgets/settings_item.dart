import 'package:flutter/material.dart';
import 'package:home_tasks/utils/colors/app_colors.dart';
import 'package:home_tasks/utils/project_extensions.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/styles/app_text_style.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({super.key, required this.pathIcon, required this.title, required this.onTab});

  final String pathIcon;
  final String title;
  final VoidCallback onTab;


  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTab,
      child: ListTile(
            contentPadding: EdgeInsets.symmetric(
                horizontal: 20.w(), vertical: 17.h()),
            leading: Container(
                height: 52.h(),
                width: 52.w(),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.c_6A6A6A),
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 15.h(), horizontal: 10.w()),
                  child: SvgPicture.asset(pathIcon),
                )),
            title: Text(
              title,
              style: AppTextStyle.poppinsMedium,
            ),
            trailing:Icon(Icons.arrow_forward_ios, color: AppColors.c_6C6C6C,size: 16,) ),
    );
  }

}
