import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_tasks/data/local/storage_repository.dart';
import 'package:home_tasks/utils/images/app_images.dart';
import 'package:home_tasks/utils/project_extensions.dart';
import 'package:home_tasks/utils/styles/app_text_style.dart';

import '../../models/page_data_model.dart';
import '../../utils/colors/app_colors.dart';
import '../auth_screen/auth_screen.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  int activeIndex = 0;
  final PageController pageController = PageController();

  List<PageDataModel> pageDate = [
    PageDataModel(imagePath: AppImages.map, title: "The best tech market"),
    PageDataModel(imagePath: AppImages.pc, title: "A lot of exclusives"),
    PageDataModel(imagePath: AppImages.procent, title: "Sales all the time"),
  ];

  _storeOnBoardInfo() async {
    final storage = StorageRepository();
    await storage.setBool(key: "isLogged", value: true);
//    print(StorageRepository.getBool(key: 'isLogged'));
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          backgroundColor: AppColors.c_0001FC,
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        209.getH(),
                        Image.asset(AppImages.map),
                        119.getH(),
                        Text(
                          "The best tech market",
                          style:
                              AppTextStyle.rubikBold.copyWith(fontSize: 24.w()),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        40.getH(),
                        Image.asset(AppImages.pc),
                        Text(
                          "A lot of exclusives",
                          style:
                              AppTextStyle.rubikBold.copyWith(fontSize: 24.w()),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        139.getH(),
                        Padding(
                          padding: EdgeInsets.only(left: 19.w()),
                          child: Image.asset(AppImages.procent),
                        ),
                        45.getH(),
                        Text(
                          "Sales all the time",
                          style:
                              AppTextStyle.rubikBold.copyWith(fontSize: 24.w()),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              30.getH(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      pageDate.length,
                      (index) => Container(
                            margin: const EdgeInsets.all(6),
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: index == activeIndex
                                  ? AppColors.white
                                  : AppColors.white.withOpacity(0.32),
                            ),
                          ))
                ],
              ),
              30.getH(),
              TextButton(
                  onPressed: () async {
                    setState(() {});
                    if (activeIndex < pageDate.length - 1) {
                      activeIndex++;
                      pageController.jumpToPage(activeIndex);
                    } else {
                      await _storeOnBoardInfo();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthScreen(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Next",
                    style:
                        AppTextStyle.rubikSemiBold.copyWith(fontSize: 18.w()),
                  )),
              10.getH(),
            ],
          ),
        ));
  }
}
