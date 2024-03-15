import 'package:flutter/material.dart';
import 'package:home_tasks/models/users/users_model.dart';
import 'package:home_tasks/utils/colors/app_colors.dart';
import 'package:home_tasks/utils/styles/app_text_style.dart';
import 'package:home_tasks/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class UsersInfoScreen extends StatelessWidget {
  const UsersInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: context.watch<UsersViewModel>().isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio:0.9,
              children: [
                ...List.generate(context.watch<UsersViewModel>().users.length,
                    (index) {
                  UsersModel user =
                      context.watch<UsersViewModel>().users[index];
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.c_0001FC.withOpacity(0.2)),
                    child: Column(
                      children: [
                        ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            user.avatarUrl,
                            height: 100,
                            width: 130,fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          user.name,
                          style: AppTextStyle.rubikBold
                              .copyWith(color: AppColors.black),
                        ),
                        Text(user.username),
                        Text(
                          user.state,
                          style: AppTextStyle.rubikBold
                              .copyWith(color: Colors.red),
                        ),
                      ],
                    ),
                  );
                })
              ],
            ),
    );
  }
}

