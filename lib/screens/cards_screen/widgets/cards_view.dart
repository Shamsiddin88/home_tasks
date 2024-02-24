import 'package:flutter/material.dart';
import 'package:home_tasks/utils/project_extensions.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/styles/app_text_style.dart';

class CardsView extends StatelessWidget {
  const CardsView(
      {super.key,
      required this.logoImage,
      required this.cardNumber,
      required this.balance,
      required this.date,
      required this.colors});

  final String logoImage;
  final String cardNumber;
  final String balance;
  final String date;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w()),
      child: Container(
        height: 165.h(),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.w()),
            gradient: LinearGradient(colors: colors)),
        child: Stack(
          children: [
            Positioned(
                right: 20.w(),
                top: 23.h(),
                child: Image.asset(
                  logoImage,
                  height: 14.h(),
                )),
            Positioned(
              top: 40.h(),
              bottom: 10.h(),
              left: 22.w(),
              right: 20.w(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardNumber,
                    style: AppTextStyle.poppinsMedium.copyWith(
                        fontSize: 24.w(),
                        color: AppColors.c_031952.withOpacity(.86)),
                  ),
                  8.getH(),
                  Text(
                    "Available Balance",
                    style: AppTextStyle.poppinsMedium.copyWith(
                        fontSize: 12.w(),
                        color: AppColors.white.withOpacity(.8)),
                  ),
                  4.getH(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        balance,
                        style: AppTextStyle.poppinsMedium
                            .copyWith(fontSize: 20.w(), color: AppColors.white),
                      ),
                      Text(
                        date,
                        style: AppTextStyle.poppinsMedium
                            .copyWith(fontSize: 14.w(), color: AppColors.white),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
