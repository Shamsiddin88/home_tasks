import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_tasks/utils/images/app_images.dart';
import 'package:provider/provider.dart';
import 'package:home_tasks/view_models/calculate_view_model.dart';
import 'package:home_tasks/screens/widget/my_button.dart';
import 'package:home_tasks/utils/colors/app_colors.dart';

class CalculateScreen extends StatelessWidget {
  final List<String> buttons = [
    'C', '%', 'DEL', '÷',
    '7', '8', '9', 'x',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '.', '0', '', '=',
  ];

  bool isSave=false;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(

      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 35,
              child:
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Consumer<CalculateViewModel>(
                      builder: (context, model, child) => Container(
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.centerRight,
                        child: Text(
                          model.answer,
                          style: TextStyle(
                              fontSize: 45,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Consumer<CalculateViewModel>(
                      builder: (context, model, child) => Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.centerRight,
                        child: Text(
                          model.userInput,
                          style: TextStyle(fontSize: 35, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 70,
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(60),),
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.0,
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return MyButton(
                        onTap: () {
                          context.read<CalculateViewModel>().clear();
                        },
                        buttonText: buttons[index],
                        textColor: Colors.red,
                      );
                    } else if (index == 1) {
                      return MyButton(
                        buttonText: buttons[index],
                        textColor: AppColors.c_00B0D7,
                        onTap: () {
                          context.read<CalculateViewModel>().addInput(buttons[index]);
                        },
                      );
                    } else if (index == 2) {
                      return MyButton(
                        onTap: () {
                          context.read<CalculateViewModel>().deleteLast();
                        },
                        buttonText: buttons[index],
                        textColor: AppColors.c_00B0D7,
                        iconImage: AppImages.back,
                      );
                    } else if (index == 18) {
                      return MyButton(
                        onTap: () {
                          isSave?context.read<CalculateViewModel>().getSave():context.read<CalculateViewModel>().save();
                          isSave=!isSave;

                                                    },
                        buttonText: buttons[index],
                        textColor: AppColors.c_00B0D7,
                        iconImage: AppImages.history,
                      );
                    }else if (index == 19) {
                      return MyButton(
                        onTap: () {
                          context.read<CalculateViewModel>().equalPressed();
                        },
                        buttonText: buttons[index],
                        textColor: AppColors.c_00B0D7,
                      );
                    } else {
                      return MyButton(
                        onTap: () {
                          context.read<CalculateViewModel>().addInput(buttons[index]);
                        },
                        buttonText: buttons[index],
                        textColor: isOperator(buttons[index])
                            ? AppColors.c_00B0D7
                            : Colors.black,
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '÷' || x == 'x' || x == '-' || x == '+' || x == '='||x == 'his') {
      return true;
    }
    return false;
  }
}
