import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_tasks/screens/boarding_screen/boarding_screen.dart';
import 'package:home_tasks/utils/images/app_images.dart';
import 'package:home_tasks/utils/styles/app_text_style.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/project_extensions.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
          statusBarIconBrightness: Brightness.dark,

        ),
        child: Scaffold(
          backgroundColor: AppColors.c_0001FC,
          body: Center(
            child: Column(children: [
              160.getH(),
              Text("LATECH", style: AppTextStyle.rubikBold.copyWith(fontSize: 42.w(), letterSpacing: 4),textAlign: TextAlign.center,),
              Text("TECH MARKET", style: AppTextStyle.rubikSemiBold.copyWith(fontSize: 12.w(), letterSpacing: 6),textAlign: TextAlign.center,),
              57.getH(),
              Container(
                width: 216.w(),
                height: 216.h(),
                decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.c_0001FC,  boxShadow: [
                  BoxShadow(
                    color: AppColors.white.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 80,
                    offset: Offset(-30, -30), // changes position of shadow
                  ),
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 80,
                    offset: Offset(30, 30), // changes position of shadow
                  ),
                ], ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 34.w()),
                  child: SvgPicture.asset(AppImages.latech),
                ),
              ),
              72.getH(),
              TextButton(
                  style: TextButton.styleFrom(

                      padding: EdgeInsets.symmetric(vertical: 16,horizontal: 110.w()),
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.w()))),
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>BoardingScreen()));},child: Text("Let’s start", style: AppTextStyle.rubikSemiBold.copyWith(color: AppColors.c_0001FC, fontSize: 18.w()),)),
              73.getH(),
              TextButton(onPressed: (){}, child: Text("Skip for now", style: AppTextStyle.rubikSemiBold.copyWith(fontSize: 18.w()),))



            ],),
          ),
        ));
  }
}
