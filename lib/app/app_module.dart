
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prova_flutter/app/modules/home/home_module.dart';

import 'modules/auth/login_module.dart';

class AppModule extends Module{
  

  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/login/', module: LoginModule()),
    ModuleRoute('/home/', module: HomeModule()),
    

  ];

}