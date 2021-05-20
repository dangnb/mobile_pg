import 'package:clean_architechture/config/colors.dart';
import 'package:flutter/material.dart';


class InputContainer extends StatelessWidget {
  const InputContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.kPrimaryColor.withAlpha(50)
      ),

      child: child
    );
  }
}