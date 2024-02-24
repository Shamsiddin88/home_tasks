import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_tasks/screens/home_screen/widget/button_items.dart';
import 'package:home_tasks/screens/home_screen/widget/cards_item.dart';
import 'package:home_tasks/screens/widgets/transact_item.dart';
import 'package:home_tasks/utils/colors/app_colors.dart';
import 'package:home_tasks/utils/images/app_images.dart';
import 'package:home_tasks/utils/project_extensions.dart';
import 'package:home_tasks/utils/styles/app_text_style.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      child: Scaffold(
        backgroundColor: AppColors.c_414A61,
        body: Column(
          children: [
            33.getH(),
            ListTile(
              title: Text(
                "Good Morning!",
                style: AppTextStyle.poppinsMedium
                    .copyWith(fontSize: 18.w(), color: AppColors.c_CECECE),
              ),
              subtitle: Text(
                "John Smith",
                style: AppTextStyle.poppinsMedium
                    .copyWith(fontSize: 22.w(), color: AppColors.c_F9F9F9),
              ),
              trailing: Image.asset(AppImages.profileImageThree),
            ),
            Text(
              "\$ 8,640.00",
              style: AppTextStyle.poppinsSemiBold
                  .copyWith(fontSize: 26.w(), color: AppColors.c_F9F9F9),
            ),
            12.getH(),
            Text(
              "Available Balance",
              style: AppTextStyle.poppinsMedium
                  .copyWith(fontSize: 14.w(), color: AppColors.c_8D8D8D),
            ),
            23.getH(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w(), vertical: 33.h()),
                  decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50.w()),
                          topLeft: Radius.circular(50.w()))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonItems(
                              title: "Transfer", imagePath: AppImages.transfer),
                          ButtonItems(title: "Bills", imagePath: AppImages.bills),
                          ButtonItems(
                              title: "Recharge", imagePath: AppImages.phone),
                          ButtonItems(title: "More", imagePath: AppImages.more),
                        ],
                      ),
                      39.getH(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "My Cards",
                            style: AppTextStyle.poppinsMedium.copyWith(
                                fontSize: 20.w(),
                                color: AppColors.c_EEEEEE.withOpacity(.8)),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text("View All",
                                  style: AppTextStyle.poppinsMedium.copyWith(
                                      decoration: TextDecoration.underline,
                                      fontSize: 14.w(),
                                      color: AppColors.c_EEEEEE.withOpacity(.8))))
                        ],
                      ),
                      29.getH(),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.c_292929,
                            borderRadius: BorderRadius.circular(20.w())),
                        child: Column(
                          children: [
                            CardsItem(cardImage: AppImages.visa, title: "Visa Card", subtitle: "**3245", sum: "\$2,200", date: "01/24"),
                            Divider(
                              color: AppColors.c_585858,
                              thickness: 1.h(),
                            ),
                            CardsItem(
                                cardImage: AppImages.master,
                                title: "Master Card",
                                subtitle: "**6539",
                                sum: "\$650",
                                date: "04/23"),

                          ],
                        ),
                      ),
                      24.getH(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recent Transactions",
                            style: AppTextStyle.poppinsMedium.copyWith(
                                fontSize: 20.w(),
                                color: AppColors.c_EEEEEE.withOpacity(.8)),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text("View All",
                                  style: AppTextStyle.poppinsMedium.copyWith(
                                      decoration: TextDecoration.underline,
                                      fontSize: 14.w(),
                                      color: AppColors.c_EEEEEE.withOpacity(.8))))
                        ],
                      ),
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
                            TransactItem(pathImage: AppImages.bill, title: "IESCO Bill", sum: "-\$120", color: AppColors.c_FFDEE2),
                
                          ],
                        ),
                      ),
                
                
                
                
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
