
import 'package:flutter/material.dart';
import 'package:prova_flutter/app/core/ui/app_colors.dart';

class ConfirmAction {
  
  ConfirmAction._();

  static void showConfirmDelete({required BuildContext context, required VoidCallback onClickConfirm, String? title, String? message}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Retorna o AlertDialog
        return AlertDialog(
          title:  Text(title ?? ''),
          content: Text(message ?? ''),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o AlertDialog
              },
              child: const Text('Fechar', style: TextStyle(color: Colors.grey),),
            ),
            TextButton(
              onPressed: (){
                onClickConfirm();
                Navigator.of(context).pop();
              },
              child:  Text('Confirmar', style: TextStyle(color: AppColors.gradientBlue),),
            )
          ],
        );
      },
    );
  }



}