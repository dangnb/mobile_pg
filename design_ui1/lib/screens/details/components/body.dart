import 'package:design_ui1/constants.dart';
import 'package:design_ui1/screens/details/components/title_and_price.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'icons_card.dart';
import 'image_and_icons.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(),
          TitleAndPrice(title: "Angelica",country: "Russia",price:440 ,),
          SizedBox(height: kDefaultPadding,),
          Row(
            children: <Widget>[
              SizedBox(
                width: size.width/2,
                height: 84,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0)
                    )
                  ),
                  color: kPrimaryColor,
                  onPressed: (){},
                  child: Text('Buy Now',style: TextStyle(color: Colors.white,fontSize: 16.0),),
                ),
              ),
              Expanded(child: FlatButton(onPressed: (){},child: Text('Description'),))
            ],
          ),
        ],
      ),
    );
  }
}

