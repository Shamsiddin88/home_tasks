import 'package:flutter/material.dart';
import 'package:home_tasks/screens/cards_screen/widgets/cards_view.dart';
import 'package:home_tasks/screens/cards_screen/widgets/settings_item.dart';
import 'package:home_tasks/utils/project_extensions.dart';
import 'package:home_tasks/utils/styles/app_text_style.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
import '../widgets/transact_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int activeIndex = 0;
  int activeButtonIndex = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            46.getH(),
            ListTile(

              leading: IconButton(onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_ios, color: AppColors.white, size: 22,)),
              title: Text("Transfer",
                style: AppTextStyle.poppinsMedium
                    .copyWith(fontSize: 24.w(), color: AppColors.c_F9F9F9),),

            ),
            47.getH(),
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
                  Container(

                    margin: EdgeInsets.symmetric(horizontal: 25.w()),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w()),
                        color: AppColors.c_7485B4), child:
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Account", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 20.w(), color: AppColors.c_F9F9F9),),
                          4.getH(),
                          Text("00342745928", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 16.w(), color: AppColors.c_F9F9F9),),


                        ],
                      ),
                    ),

                  ),
                  Container(

                    margin: EdgeInsets.symmetric(horizontal: 25.w()),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w()),
                        color: AppColors.c_031952), child:
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Account", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 20.w(), color: AppColors.c_F9F9F9),),
                          4.getH(),
                          Text("586648222466", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 16.w(), color: AppColors.c_F9F9F9),),


                        ],
                      ),
                    ),

                  ),

                ],
              ),
            ),
            19.getH(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    2,
                        (index) =>
                        Container(
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
            Padding(
              padding: EdgeInsets.symmetric (horizontal: 25.w(), vertical: 20.h()),
              child: Text("To", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 20, color: AppColors.white),),
            ),
            SizedBox(
              height: 85.h(),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.w()),
                    child: Column(
                      children: [
                        Container(height: 54.h(), width: 54.w(), decoration:
                          BoxDecoration(shape: BoxShape.circle, color: AppColors.c_BECAF5) ,child: Icon(Icons.add, color: AppColors.c_031952,),),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.w()),
                    child: Column(children: [
                    Image.asset(AppImages.profileImageOne, height: 54.h(),),
                    Text("Sara", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 12.w(), color: AppColors.c_F9F9F9),)
                                    ],),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.w()),
                    child: Column(children: [
                    Image.asset(AppImages.profileImageTwo, height: 54.h(),),
                    Text("Calira", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 12.w(), color: AppColors.c_F9F9F9),)
                                    ],),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.w()),
                    child: Column(children: [
                    Image.asset(AppImages.profileImageFour, height: 54.h(),),
                    Text("Aliya", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 12.w(), color: AppColors.c_F9F9F9),)
                                    ],),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.w()),
                    child: Column(children: [
                    Image.asset(AppImages.profileImageFive, height: 54.h(),),
                    Text("Bob", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 12.w(), color: AppColors.c_F9F9F9),)
                                    ],),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.w()),
                    child: Column(children: [
                    Image.asset(AppImages.profileImageSix, height: 54.h(),),
                    Text("Samy", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 12.w(), color: AppColors.c_F9F9F9),)
                                    ],),
                  ),

              ],),
            ),
            43.getH(),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 25.w()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Amount", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 18.w(), color: AppColors.c_EEEEEE.withOpacity(.8)),),
                35.getH(),
                Text("\$0.00", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 20.w(), color: AppColors.c_EEEEEE),),
                Divider(
                  color: AppColors.c_585858,
                  thickness: 1.h(),
                ),
                21.getH(),
                  Text("Purpose", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 18.w(), color: AppColors.c_EEEEEE.withOpacity(.8)),),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Education", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 20.w(), color: AppColors.c_EEEEEE),),
                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down_sharp, color: AppColors.c_EEEEEE, size: 40,))
                    ],
                  ),
                  Divider(
                    color: AppColors.c_585858,
                    thickness: 1.h(),
                  ),
                  51.getH(),
                  Ink(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(14.w()),  color: AppColors.c_414A61,),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14.w()),
                      onTap: (){},
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 18.h()),
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(14.w()), ),
                        child: Text("Send", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 20.w(), color: AppColors.c_F9F9F9),textAlign: TextAlign.center,),
                      ),
                    ),
                  ),
                  39.getH()





              ],),
            ),





          ],
        ),
      ),
    );
  }
}
