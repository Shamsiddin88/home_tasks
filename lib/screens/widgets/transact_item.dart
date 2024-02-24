import 'package:flutter/material.dart';
import 'package:home_tasks/utils/project_extensions.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/styles/app_text_style.dart';

class TransactItem extends StatelessWidget {
  const TransactItem({
    super.key,
    required this.pathImage,
    required this.title,
    required this.sum,
    required this.color,
  });

  final String pathImage;
  final String title;
  final String sum;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w(), vertical: 17.h()),
        leading: Container(
            height: 52.h(),
            width: 52.w(),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: color),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 15.h(), horizontal: 10.w()),
              child: SvgPicture.asset(pathImage),
            )),
        title: Text(
          title,
          style: AppTextStyle.poppinsMedium,
        ),
        trailing: RichText(
          text: TextSpan(style: AppTextStyle.poppinsMedium, children: [
            TextSpan(
              text: sum,
              style: AppTextStyle.poppinsMedium,
            ),

          ]),
        ));
  }
}
