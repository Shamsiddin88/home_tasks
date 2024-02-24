import 'package:flutter/material.dart';
import 'package:home_tasks/screens/cards_screen/widgets/cards_view.dart';
import 'package:home_tasks/screens/cards_screen/widgets/settings_item.dart';
import 'package:home_tasks/screens/widgets/transact_item.dart';
import 'package:home_tasks/utils/project_extensions.dart';
import 'package:home_tasks/utils/styles/app_text_style.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  int activeButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              46.getH(),
              Center(
                  child: Text("Transactions",
                      style: AppTextStyle.poppinsMedium
                          .copyWith(fontSize: 24.w(), color: AppColors.c_F9F9F9))),
              47.getH(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent",
                    style: AppTextStyle.poppinsMedium.copyWith(
                        fontSize: 20.w(),
                        color: AppColors.c_EEEEEE.withOpacity(.8)),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text("Select Time Range",
                          style: AppTextStyle.poppinsMedium.copyWith(
                              decoration: TextDecoration.underline,
                              fontSize: 14.w(),
                              color: AppColors.c_EEEEEE.withOpacity(.8))))
                ],
              ),
              14.getH(),
              SizedBox(
                height: 80.h(),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: (){activeButtonIndex=1; setState(() {});},   child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.w(), vertical: 15.h()),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.w()), color: activeButtonIndex==1? AppColors.c_414A61:AppColors.c_414A61.withOpacity(.5)),
                          child: Column(children: [
                            Text("All", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 14, color: activeButtonIndex==1? AppColors.white:AppColors.white.withOpacity(.5)),),

                          ],),
                        ),),
                        TextButton(onPressed: (){activeButtonIndex=2; setState(() {});},   child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.w(), vertical: 15.h()),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.w()), color: activeButtonIndex==2? AppColors.c_414A61:AppColors.c_414A61.withOpacity(.5)),
                          child: Column(children: [
                            Row(
                              children: [
                                SvgPicture.asset(AppImages.income),
                                12.getW(),
                                Text("Income", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 14, color: activeButtonIndex==2? AppColors.white:AppColors.white.withOpacity(.5)),),
                              ],
                            ),

                          ],),
                        ),),
                        TextButton(onPressed: (){activeButtonIndex=3; setState(() {});},   child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.w(), vertical: 15.h()),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.w()), color: activeButtonIndex==3? AppColors.c_414A61:AppColors.c_414A61.withOpacity(.5)),
                          child: Column(children: [
                            Row(
                              children: [
                                SvgPicture.asset(AppImages.expense),
                                12.getW(),
                                Text("Expense", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 14, color: activeButtonIndex==3? AppColors.white:AppColors.white.withOpacity(.5)),),
                              ],
                            ),

                          ],),
                        ),),
                      ],
                    ),
                  ],
                ),
              ),
              24.getH(),
              Text("Today", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 20, color: AppColors.white),),
              29.getH(),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.c_292929,
                    borderRadius: BorderRadius.circular(20.w())),
                child: Column(
                  children: [
                    TransactItem(pathImage: AppImages.cart, title: "Grocery", sum: "-\$400", color: AppColors.c_FFDEE2),
                    Divider(
                      color: AppColors.c_585858,
                      thickness: 1.h(),
                    ),
                    TransactItem(pathImage: AppImages.bill, title: "IESCO Bill", sum: "-\$120", color: AppColors.c_FFE8CE),





                  ],
                ),
              ),
              32.getH(),
              Text("Yesterday", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 20, color: AppColors.white),),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.c_292929,
                    borderRadius: BorderRadius.circular(20.w())),
                child: Column(
                  children: [
                    TransactItem(pathImage: AppImages.salary, title: "Salary", sum: "\$6500", color: AppColors.c_BECAF5),
                    Divider(
                      color: AppColors.c_585858,
                      thickness: 1.h(),
                    ),
                    TransactItem(pathImage: AppImages.bill, title: "Mobile Bill", sum: "-\$235", color: AppColors.c_FFE8CE),





                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
