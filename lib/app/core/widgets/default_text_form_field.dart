import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextFormField extends StatefulWidget {
  final String label;
  final IconData? icon;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final bool? obscureText;

  const DefaultTextFormField(
      {super.key,
      required this.label,
      this.icon,
      this.validator,
      this.controller,
      this.obscureText});

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 7),
          child: Text(
            widget.label,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300, fontSize: 17),
          ),
        ),
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ]),
          child: TextFormField(
            
            obscureText: widget.obscureText ?? false,
            controller: widget.controller,
            validator: widget.validator,
            cursorColor: Colors.black,
            inputFormatters: [
              LengthLimitingTextInputFormatter(20),
            ],
            decoration: InputDecoration(
              prefixIcon: widget.icon != null
                  ? Icon(
                      widget.icon,
                      size: 20,
                      color: Colors.black,
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.white),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.white),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Color(0XFFC25151)),
              ),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        )
      ],
    );
  }
}
