import 'package:flutter/material.dart';
import 'package:hive_chat/constants.dart';

class ButtonCustom extends StatelessWidget {
  final void Function()? onTap;
  final String text;

  const ButtonCustom({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(9),
        ),
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Text(
            text,
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
