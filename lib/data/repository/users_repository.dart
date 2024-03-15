import 'package:home_tasks/data/network/api_provider.dart';
import 'package:home_tasks/models/users/users_model.dart';

class UsersRepository {
  final ApiProvider apiProvider;

  UsersRepository({required this.apiProvider});

  Future <List<UsersModel>> getInfoUsers()=>apiProvider.getInfoUsers();



}