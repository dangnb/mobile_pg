import 'package:design_ui1/components/my_bottom_nav_bar.dart';
import 'package:design_ui1/constants.dart';
import 'package:design_ui1/screens/home/components/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar:_buildAppBar(),
     body: Body(),
     bottomNavigationBar: MyBottomNavBar(),
   );
  }
  AppBar _buildAppBar(){
    return AppBar(
      elevation: 0,
      leading: IconButton(icon: SvgPicture.asset("assets/icons/menu.svg"),onPressed: (){}),
    );
  }
}