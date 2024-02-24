import 'package:flutter/material.dart';
import 'package:home_tasks/screens/cards_screen/cards_screen.dart';
import 'package:home_tasks/screens/home_screen/home_screen.dart';
import 'package:home_tasks/screens/profile_screen/profile_screen.dart';
import 'package:home_tasks/screens/transactions_screen/transactions_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_tasks/utils/colors/app_colors.dart';
import 'package:home_tasks/utils/images/app_images.dart';
import 'package:home_tasks/utils/project_extensions.dart';
import 'package:home_tasks/utils/styles/app_text_style.dart';

class TabBoxThird extends StatefulWidget {
  const TabBoxThird({super.key});

  @override
  State<TabBoxThird> createState() => _TabBoxThirdState();
}

class _TabBoxThirdState extends State<TabBoxThird> {
  int _activeIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
      bottomNavigationBar: SizedBox(
        height: 111.h(),
        width: double.infinity,
        child: BottomNavigationBar(
          unselectedItemColor: AppColors.c_8D8D8D,
          selectedItemColor: AppColors.c_F9F9F9,
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle: AppTextStyle.poppinsMedium.copyWith(fontSize: 12.w(), color: AppColors.c_8D8D8D),
          selectedLabelStyle: AppTextStyle.poppinsMedium.copyWith(fontSize: 12.w(), color: AppColors.c_F9F9F9),
          onTap: (newActiveIndex){_activeIndex = newActiveIndex; setState(() {

          });
            switch (newActiveIndex){
              case 1 :{
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CardsScreen()));
                break;}
              case 2 :{
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TransactionsScreen()));
                break;}
              case 3 :{
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                break;}
            }
            },
          currentIndex: _activeIndex,
          backgroundColor: AppColors.black,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.home, colorFilter: ColorFilter.mode(AppColors.c_8D8D8D, BlendMode.srcIn),),
                label: "Home",
                activeIcon: SvgPicture.asset(
                  AppImages.home,
                  colorFilter: ColorFilter.mode(AppColors.c_F9F9F9, BlendMode.srcIn),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.cards, colorFilter: ColorFilter.mode(AppColors.c_8D8D8D, BlendMode.srcIn),),
                label: "Cards",
                activeIcon: SvgPicture.asset(
                  AppImages.cards,
                  colorFilter: ColorFilter.mode(AppColors.c_F9F9F9, BlendMode.srcIn),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.transactions, colorFilter: ColorFilter.mode(AppColors.c_8D8D8D, BlendMode.srcIn),),
                label: "Transactions",
                activeIcon: SvgPicture.asset(
                  AppImages.transactions,
                  colorFilter: ColorFilter.mode(AppColors.c_F9F9F9, BlendMode.srcIn),
                )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.profile, colorFilter: ColorFilter.mode(AppColors.c_8D8D8D, BlendMode.srcIn),),
                label: "Profile",
                activeIcon: SvgPicture.asset(
                  AppImages.profile,
                  colorFilter: ColorFilter.mode(AppColors.c_F9F9F9, BlendMode.srcIn),
                )),

          ],
        ),
      ),
    );
  }
}