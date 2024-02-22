import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_tasks/data/local/storage_repository.dart';
import 'package:home_tasks/models/auth_model.dart';
import 'package:home_tasks/screens/auth_screen/widgets/universal_text_input.dart';
import 'package:home_tasks/screens/home_screen.dart';
import 'package:home_tasks/utils/images/app_images.dart';
import 'package:home_tasks/utils/project_extensions.dart';
import 'package:home_tasks/utils/styles/app_text_style.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/constants/app_constant.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  int activeIndex = 0;

  final PageController pageController = PageController();

  List<AuthModel> pageDate = [
  AuthModel(title: "Connexion"),
  AuthModel(title: "Create an account"),
  AuthModel(title: "Login"),
  ];

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
            statusBarColor: AppColors.transparent,
            statusBarIconBrightness: Brightness.dark,),
        child: Scaffold(
          backgroundColor: AppColors.c_0001FC,
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (int pageIndex) {
                    if (activeIndex<pageDate.length){
                      setState(() {
                        activeIndex = pageIndex;
                      });}
                    else {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                      const HomeScreen()));}
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        children: [
                          67.getH(),
                          Text("Connexion", style: AppTextStyle.rubikBold.copyWith(fontSize: 24.w()),),
                          245.getH(),
                          Material(
                            color: AppColors.transparent,
                            child: Ink(
                              decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(4)),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(4),
                                  onTap: () {
                                    setState(() {
                                      activeIndex = 1; // Create an account sahifasiga o'tish
                                    });
                                    pageController.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.ease); // PageViewni Create an account sahifasiga o'tkazish
                                  },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 16.h()),
                                  width: double.infinity,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
                                  child: Text("Create an account",textAlign: TextAlign.center, style: AppTextStyle.rubikSemiBold.copyWith(fontSize: 18, color: AppColors.c_0001FC),),),
                              ),
                            ),
                          ),
                          32.getH(),
                          Material(
                            color: AppColors.transparent,
                            child: Ink(
                              decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(4)),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(4),
                                onTap: (){},
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 16.h()),
                                  width: double.infinity,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(AppImages.google, height: 24.h(),),
                                      24.getW(),
                                      Text("Create an account",textAlign: TextAlign.center, style: AppTextStyle.rubikSemiBold.copyWith(fontSize: 18, color: AppColors.c_555555),),
                                    ],
                                  ),),
                              ),
                            ),
                          ),
                          16.getH(),
                          Material(
                            color: AppColors.transparent,
                            child: Ink(
                              decoration: BoxDecoration(color: AppColors.c_415A93, borderRadius: BorderRadius.circular(4)),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(4),
                                onTap: (){},
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 16.h()),
                                  width: double.infinity,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(AppImages.facebook, height: 24.h(),),
                                      24.getW(),
                                      Text("Connect with Facebook",textAlign: TextAlign.center, style: AppTextStyle.rubikSemiBold.copyWith(fontSize: 18),),
                                    ],
                                  ),),
                              ),
                            ),
                          ),
                          40.getH(),
                          TextButton( onPressed: () {
                            setState(() {
                              activeIndex = 2; //
                            });
                            pageController.animateToPage(2, duration: Duration(milliseconds: 300), curve: Curves.ease); // PageViewni Create an account sahifasiga o'tkazish
                          }, child: Text("Already have an account ? Login", style: AppTextStyle.rubikRegular.copyWith(fontSize: 18.w(), color: AppColors.c_FBDF00),))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        children: [
                          67.getH(),
                          Text("Create an account", style: AppTextStyle.rubikBold.copyWith(fontSize: 24.w()),),
                          127.getH(),
                          UniversalTextInput(controller: nameController, hintText: "Full name", type: TextInputType.text, regExp:  AppConstants.textRegExp, errorTitle: "Name", title: "Full name"),
                          24.getH(),
                          UniversalTextInput(controller: emailController, hintText: "Email", type: TextInputType.emailAddress, regExp:  AppConstants.emailRegExp, errorTitle: "Email", title: "Email"),
                          24.getH(),
                          UniversalTextInput(controller: passwordController, hintText: "Password", type: TextInputType.visiblePassword, regExp:  AppConstants.passwordRegExp, errorTitle: "Password", title: "Password"),
                          32.getH(),
                          Material(
                            color: AppColors.transparent,
                            child: Ink(
                              decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(4)),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(4),
                                onTap: (){
                                  StorageRepository.setString(key: "full_name", value: nameController.toString(),);
                                  StorageRepository.setString(key: "email", value: emailController.toString(),);
                                  StorageRepository.setString(key: "password", value: passwordController.toString(),);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 16.h()),
                                  width: double.infinity,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
                                  child: Text("Validate",textAlign: TextAlign.center, style: AppTextStyle.rubikSemiBold.copyWith(fontSize: 18, color: AppColors.c_0001FC),),),
                              ),
                            ),
                          ),
                          TextButton(onPressed: (){}, child: Text("Already have an account ? Login", style: AppTextStyle.rubikRegular.copyWith(fontSize: 18.w(), color: AppColors.c_FBDF00),))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        children: [
                          67.getH(),
                          Text("Login", style: AppTextStyle.rubikBold.copyWith(fontSize: 24.w()),),
                          215.getH(),
                          UniversalTextInput(controller: emailController, hintText: "Email", type: TextInputType.emailAddress, regExp:  AppConstants.emailRegExp, errorTitle: "Email", title: "Email"),
                          24.getH(),
                          UniversalTextInput(controller: passwordController, hintText: "Password", type: TextInputType.visiblePassword, regExp:  AppConstants.passwordRegExp, errorTitle: "Password", title: "Password"),
                          32.getH(),
                          Material(
                            color: AppColors.transparent,
                            child: Ink(
                              decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(4)),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(4),
                                onTap: (){if (StorageRepository.getString(key: "email")==emailController && StorageRepository.getString(key: "password")==passwordController ) {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                                }
    },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 16.h()),
                                  width: double.infinity,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
                                  child: Text("Validate",textAlign: TextAlign.center, style: AppTextStyle.rubikSemiBold.copyWith(fontSize: 18, color: AppColors.c_0001FC),),),
                              ),
                            ),
                          ),
                          TextButton(onPressed: (){}, child: Text("Already have an account ? Login", style: AppTextStyle.rubikRegular.copyWith(fontSize: 18.w(), color: AppColors.c_FBDF00),))
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              20.getH(),
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
              TextButton(onPressed: (){setState(() {
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                const HomeScreen()));
              });}, child: Text("Skip for now", style: AppTextStyle.rubikSemiBold.copyWith(fontSize: 18.w()),)),
              10.getH(),

            ],
          ),
        ));
  }
}
