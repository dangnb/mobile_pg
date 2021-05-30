import 'package:design_ui1/constants.dart';
import 'package:design_ui1/screens/home/components/recomend_plants.dart';
import 'package:design_ui1/screens/home/components/title_with_more_bbtn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'feature_plants.dart';
import 'header_with_searchbox.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Recomended", prress: () {}),
          //it  will cover 40% of our total width
          RecomendPlants(),
          TitleWithMoreBtn(title: "Featured Plants", prress: () {}),
          FeaturePlants(),
          SizedBox(height: kDefaultPadding,)
        ],
      ),
    );
  }
}


