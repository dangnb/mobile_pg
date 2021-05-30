import 'package:flutter/cupertino.dart';

import '../../../constants.dart';

class FeaturePlants extends StatelessWidget{
  const FeaturePlants({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return SingleChildScrollView(
     scrollDirection: Axis.horizontal,
     child:Row(
       children: <Widget>[
         FeaturePlantCart(
           image: "assets/images/bottom_img_1.png",
           press: () {},
         ),
         FeaturePlantCart(
           image: "assets/images/bottom_img_1.png",
           press: () {},
         ), FeaturePlantCart(
           image: "assets/images/bottom_img_1.png",
           press: () {},
         )
       ],
     ) ,
   );
  }
}
class FeaturePlantCart extends StatelessWidget {
  const FeaturePlantCart({Key? key, required this.image, required this.press})
      : super(key: key);
  final String image;
  final dynamic press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
            left: kDefaultPadding,
            top: kDefaultPadding / 2,
            bottom: kDefaultPadding / 2),
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(image: AssetImage(image))),
      ),
    );
  }
}