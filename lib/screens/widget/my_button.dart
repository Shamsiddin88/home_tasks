import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/colors/app_colors.dart';

class MyButton extends StatelessWidget {

  final Color textColor;
  final String buttonText;
  final VoidCallback onTap;
  final String? iconImage;
  const MyButton({required this.textColor,required this.buttonText,required this.onTap, this.iconImage});

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: AppColors.c_E9F6FF,
      child: InkWell(
      
        onTap: onTap,
        child: Container(

          child: Center(
            child:iconImage!=null? SvgPicture.asset(iconImage!, height: 24,width: 24,): Text(
              buttonText,
              style: TextStyle(
                color: textColor,
                fontSize: 35,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
