import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:prova_flutter/app/core/helpers/constants.dart';
import 'package:prova_flutter/app/core/models/user_model.dart';

import './auth_service.dart';

class AuthServiceImpl extends AuthService {
  final Dio _dio = Dio(BaseOptions(baseUrl: Constants.baseUrlAuth));

  @override
  Future<bool> logIn({required String user, required String password}) async {
    List<UserModel> users = [];

    try {
      final response = await _dio.get("/users");

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        users = data.map((json) => UserModel.fromMap(json)).toList();
      }

      if (users.isNotEmpty) {
        UserModel? userLogged;
        for (var userList in users) {
          if (userList.username == user && userList.password == password) {
            userLogged = userList;
          }
        }

        if (userLogged != null) {
          return true;
        }
      }
      return false;
    } on Exception catch (e) {
      Logger().e("AuthServiceImpl - logIn ", error: e.toString());
      throw Exception("Erro ao tentar realizar o login");
    }
  }
}
