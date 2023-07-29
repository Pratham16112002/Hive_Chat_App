import 'package:flutter/material.dart';
import 'package:hive_chat/constants.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController controller;
  final hintText;
  final obscureText;
  const TextFieldCustom(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          fillColor: Colors.grey[200],
          filled: true,
          hintStyle: kTextFieldHintStyle),
    );
  }
}
