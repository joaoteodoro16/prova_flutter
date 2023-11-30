
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prova_flutter/app/modules/auth/login_controller_store.dart';
import 'package:prova_flutter/app/modules/auth/login_page.dart';
import 'package:prova_flutter/app/services/auth/auth_service.dart';
import 'package:prova_flutter/app/services/auth/auth_service_impl.dart';

class LoginModule extends Module{

  @override
  List<Bind<Object>> get binds => [
    Bind<AuthService>((i) => AuthServiceImpl()),
    Bind.lazySingleton((i) => LoginControllerStore(authService: i()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) =>  LoginPage(controller: Modular.get()),)
  ];
  
}