import 'package:flutter/material.dart';
import 'package:home_tasks/utils/project_extensions.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/styles/app_text_style.dart';

class CardsItem extends StatelessWidget {
  const CardsItem(
      {super.key,
      required this.cardImage,
      required this.title,
      required this.subtitle,
      required this.sum,
      required this.date,
      });

  final String cardImage;
  final String title;
  final String subtitle;
  final String sum;
  final String date;


  @override
  Widget build(BuildContext context) {
    return
      ListTile(
        leading: Container(
            height: 52.h(),
            width: 52.w(),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: AppColors.c_E9E9E9),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h(), horizontal: 10.w()),
              child: Image.asset(cardImage),
            )),
        title: Text(
          title,
          style: AppTextStyle.poppinsMedium,
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyle.poppinsMedium.copyWith(
              fontSize: 12.w(), color: AppColors.c_EEEEEE.withOpacity(.6)),
        ),
        trailing: RichText(
          text: TextSpan(style: AppTextStyle.poppinsMedium, children: [
            TextSpan(
              text: sum,
              style: AppTextStyle.poppinsMedium,
            ),
            TextSpan(
                text: "\n      $date",
                style: AppTextStyle.poppinsMedium.copyWith(
                    fontSize: 12.w(),
                    color: AppColors.c_EEEEEE.withOpacity(.6))),
          ]),
        ));
  }
}
