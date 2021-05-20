import 'package:clean_architechture/config/colors.dart';
import 'package:flutter/material.dart';
import 'input_container.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({
     Key? key,
    required this.icon,
    required this.hint,
    required this.controller
  }) : super(key: key);
  final TextEditingController controller;
  final IconData icon;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      key: key,
      child: TextField(
        controller: controller,
        cursorColor: AppColors.kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(icon, color: AppColors.kPrimaryColor),
          hintText: hint,
          border: InputBorder.none
        ),
      ));
  }
}