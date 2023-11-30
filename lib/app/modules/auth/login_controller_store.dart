import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:prova_flutter/app/core/ui/loader.dart';
import 'package:prova_flutter/app/core/ui/messages.dart';
import 'package:prova_flutter/app/services/auth/auth_service.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/helpers/constants.dart';

part 'login_controller_store.g.dart';

class LoginControllerStore = LoginControllerStoreBase
    with _$LoginControllerStore;

abstract class LoginControllerStoreBase with Store {
  final AuthService _authService;

  LoginControllerStoreBase({required AuthService authService})
      : _authService = authService;

  

  Future<void> logIn({required String user, required String password}) async {
    try {
      Loader.show();
      if (await _authService.logIn(user: user, password: password)) {
        Modular.to.navigate('/home/');
      } else {
        Messages.alert('Usuário ou senha inválidos!');
      }
    } on Exception catch (e) {
      Messages.alert(e.toString());
    } finally {
      Loader.hide();
    }
  }
}
