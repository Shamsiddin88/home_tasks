import 'package:flutter/material.dart';
import 'package:home_tasks/screens/cards_screen/widgets/cards_view.dart';
import 'package:home_tasks/screens/cards_screen/widgets/settings_item.dart';
import 'package:home_tasks/utils/project_extensions.dart';
import 'package:home_tasks/utils/styles/app_text_style.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
import '../widgets/transact_item.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  int activeIndex = 0;
  int activeButtonIndex = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            46.getH(),
            Center(
                child: Text("My Cards",
                    style: AppTextStyle.poppinsMedium
                        .copyWith(fontSize: 24.w(), color: AppColors.c_F9F9F9))),
            48.getH(),
            SizedBox(
              height: 170.h(),
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: pageController,
                onPageChanged: (int pageIndex) {
                  setState(() {
                    activeIndex = pageIndex;
                  });
                },
                children: [
                  CardsView(
                      logoImage: AppImages.visa,
                      cardNumber: "**** **** **** 3245 ",
                      balance: "\$2200",
                      date: "01/24",
                      colors: [AppColors.c_5A6D9E, AppColors.c_BECAF5]),
                  CardsView(
                      logoImage: AppImages.master,
                      cardNumber: "**** **** **** 6539 ",
                      balance: "\$650",
                      date: "04/23",
                      colors: [
                        AppColors.c_FFA200.withOpacity(0.8),
                        AppColors.c_FFE8CE
                      ])
                ],
              ),
            ),
            19.getH(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    2,
                    (index) => Container(
                          margin: const EdgeInsets.all(6),
                          width: 14.w(),
                          height: 14.h(),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: index == activeIndex
                                ? AppColors.c_B1BEEC
                                : AppColors.c_6C6C6C,
                          ),
                        ))
              ],
            ),
            33.getH(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 26.w()),
              width: double.infinity,
              height: 90.h(),
              decoration: BoxDecoration(color: AppColors.c_414A61, borderRadius: BorderRadius.circular(16.w())),
              child: Stack(children: [
                Positioned(
                    left:26.w(),
                    top: 28.h(),
                    child: Text("Make a Payment", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 20.w(), color: AppColors.white),)),
                Positioned(
                  top: 20.h(),
                  right: 19.w(),
        
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    Text("\$220", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 20.w(), color: AppColors.white),),
                    4.getH(),
                    Text("Due: Feb 10, 2022", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 12.w(), color: AppColors.white.withOpacity(.76)),),
        
        
                  ],),
                )
              ],),
            ),
            48.getH(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){activeButtonIndex=1; setState(() {});},   child: Container(
                  width: 150.w(),
                  padding: EdgeInsets.symmetric(horizontal: 40.w(), vertical: 15.h()),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.w()), color: activeButtonIndex==1? AppColors.c_414A61:AppColors.c_414A61.withOpacity(.5)),
                  child: Column(children: [
                    Text("Settings", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 14, color: activeButtonIndex==1? AppColors.white:AppColors.white.withOpacity(.5)),),
        
                  ],),
                ),),
                TextButton(onPressed: (){activeButtonIndex=2; setState(() {});},   child: Container(
                  width: 150.w(),
                  padding: EdgeInsets.symmetric(horizontal: 20.w(), vertical: 15.h()),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.w()), color: activeButtonIndex==2? AppColors.c_414A61:AppColors.c_414A61.withOpacity(.5)),
                  child: Column(children: [
                    Text("Transactions", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 14, color: activeButtonIndex==2? AppColors.white:AppColors.white.withOpacity(.5)),),
        
                  ],),
                ),),
              ],
            ),
            41.getH(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 27.w()),
              decoration: BoxDecoration(
                  color: AppColors.c_292929,
                  borderRadius: BorderRadius.circular(20.w())),
              child: Column(
                children: [
                  SettingsItem(pathIcon: AppImages.bill, title: "View Statement", onTab: (){}),
                  Divider(
                    color: AppColors.c_585858,
                    thickness: 1.h(),
                  ),
                  SettingsItem(pathIcon: AppImages.pin, title: "Change Pin", onTab: (){}),
                  Divider(
                    color: AppColors.c_585858,
                    thickness: 1.h(),
                  ),
                  SettingsItem(pathIcon: AppImages.remove, title: "Remove Card", onTab: (){}),
        
        
        
        
                ],
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}
