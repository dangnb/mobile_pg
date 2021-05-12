import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CitySearchScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CitySearchScreenState();
  }
}
class _CitySearchScreenState extends State<CitySearchScreen>{
  final TextEditingController _cityTextEditingController= TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Enter city'),),
      body: Form(
        child: Row(
          children:<Widget> [
            Expanded(child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: TextFormField(
                controller: _cityTextEditingController,
                decoration: InputDecoration(
                  labelText: 'Enter a city',
                  hintText: 'Example: chicago',

                ),
                keyboardType: TextInputType.text,
              ),
            )),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pop(context, _cityTextEditingController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}