import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prova_flutter/app/modules/home/home_controller_store.dart';

class HomeTextFormField extends StatelessWidget {
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final FocusNode? focus;
  final ValueChanged<String>? onFieldSubmitted;

  const HomeTextFormField(
      {super.key,
      this.validator,
      required this.controller,
      this.onFieldSubmitted,
      this.focus});

  @override
  Widget build(BuildContext context) {
    final homeController = Modular.get<HomeControllerStoreBase>();
    return TextFormField(
      controller: controller,
      focusNode: focus,
      onFieldSubmitted: (value) async {
        final indexSelected = homeController.indexSelectec;

        if (indexSelected != null) {
          await homeController
              .editNote(index: indexSelected, note: controller.text);
        } else {
          await homeController.saveNote(note: controller.text);
        }
        controller.text = "";
        homeController.clearIndexSelected();
        focus?.requestFocus();
      },
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 19),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: 'Digite seu texto',
        hintStyle: const TextStyle(
          color: Colors.black,
          fontSize: 19,
          fontWeight: FontWeight.w800,
        ),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
