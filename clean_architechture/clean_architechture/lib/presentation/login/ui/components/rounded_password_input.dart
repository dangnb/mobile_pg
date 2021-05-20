import 'package:clean_architechture/config/colors.dart';
import 'package:flutter/material.dart';
import 'input_container.dart';

class RoundedPasswordInput extends StatelessWidget {
  const RoundedPasswordInput({
     Key? key,
    required this.hint,
    required this.controller
  }) : super(key: key);
 final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        controller: controller,
        cursorColor: AppColors.kPrimaryColor,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock, color: AppColors.kPrimaryColor),
          hintText: hint,
          border: InputBorder.none
        ),
      ));
  }
}