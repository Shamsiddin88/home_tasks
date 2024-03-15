import 'package:flutter/cupertino.dart';
import 'package:home_tasks/data/repository/users_repository.dart';

import '../models/users/users_model.dart';

class UsersViewModel extends ChangeNotifier {

  UsersViewModel({required this.usersRepository}){
    _fetchUsers();
  }

  final UsersRepository usersRepository;

  bool isLoading = false;
  List <UsersModel> users = [];

  _fetchUsers() async{
    isLoading = true;
    notifyListeners();
    var userInfo = await usersRepository.getInfoUsers();
    isLoading = false;
    notifyListeners();
    if (userInfo.isEmpty){

    }
    else{
      users = userInfo;
      notifyListeners();
    }
  }
}