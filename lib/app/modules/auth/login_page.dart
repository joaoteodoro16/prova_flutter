import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prova_flutter/app/core/ui/app_colors.dart';
import 'package:prova_flutter/app/modules/auth/login_controller_store.dart';
import 'package:prova_flutter/app/modules/auth/widgets/login_button.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/widgets/privacy_police_button.dart';
import '../../core/widgets/container_background_linear_gradiente.dart';
import '../../core/widgets/default_text_form_field.dart';

class LoginPage extends StatefulWidget {
  final LoginControllerStore controller;

  const LoginPage({super.key, required this.controller});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginControllerStore> {
  final _userEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _userEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gradientBlue,
      body: Stack(
        children: [
          const ContainerBackgroundLinearGradiente(),
          Padding(
          padding: const EdgeInsets.only(left: 36, right: 36),
          child: Column(
            children: [
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultTextFormField(
                        label: 'Usuário',
                        icon: Icons.person,
                        controller: _userEC,
                        validator: Validatorless.multiple(
                          [Validatorless.required('Campo obrigatório!')],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DefaultTextFormField(
                        label: 'Senha',
                        icon: Icons.lock,
                        controller: _passwordEC,
                        validator: Validatorless.multiple([
                          Validatorless.regex(RegExp(r'^[a-zA-Z0-9]+$'), 'Permitido somente números e letras!'),
                          Validatorless.min(2, 'Necessário mais de 2 caracteres!'),
                          Validatorless.required("Campo obrigatório!"),
                        ]),
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * .45,
                        child: LoginButton(
                          onClick: () async {
                            final validate =
                                _formKey.currentState?.validate() ?? false;
                            if (validate) {
                              await widget.controller.logIn(
                                  user: _userEC.text,
                                  password: _passwordEC.text);
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const PrivacyPoliceButton()
            ],
          ),
        )
        ],
      )
    );
  }
}
