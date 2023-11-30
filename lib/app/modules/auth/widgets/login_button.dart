import 'package:flutter/material.dart';
import 'package:prova_flutter/app/core/ui/app_colors.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback? onClick;
  const LoginButton({super.key, this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.greenButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        child: const Text(
          'Entrar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
