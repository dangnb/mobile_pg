import 'package:clean_architechture/presentation/check_in/ui/check_in.dart';
import 'package:clean_architechture/presentation/notification/notification.dart';
import 'package:clean_architechture/utils/route/app_routing.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey _keyRed = GlobalKey();
  String containerSize = "";
  String dropdownValue = 'One';
  String get _containerSize =>
      containerSize.isNotEmpty ? "Container Width Height : $containerSize" : "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tập đoàn ESC'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',

            onPressed: () {
              // ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(content: Text('This is a snackbar')));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThongBao()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('Bắt đầu:'),
                  Container(
                    width: 100.0,
                    child: TextField(
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    child: Text("Check in"),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.pushNamed(context, RouteDefine.CheckInScreen.name);
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Text('Kết thúc:'),
                  Container(
                    width: 100.0,
                    child: const TextField(
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    child: Text("Check out"),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.pushNamed(context, RouteDefine.CheckOutScreen.name);
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: 200.0,
              child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple,),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue)  {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['One', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,textAlign: TextAlign.center),
                    );
                  }).toList()),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0),
              width: 700.0,
              height: 300.0,
              child: const Expanded(
                child: Text('Bieu do'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(0),
                          padding: EdgeInsets.all(0),
                          width: 100.0,
                          height: 30.0,
                          decoration: const BoxDecoration(
                              color: Colors.blue
                          ),
                          child: const Center(child: Text('Da dat',textAlign: TextAlign.center,),),
                        ),
                        Container(
                          margin: const EdgeInsets.all(0),
                          padding: const EdgeInsets.all(0),
                          width: 100.0,
                          height: 30.0,
                          child: Center(child: const Text('0 VND',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(0),
                          padding: const EdgeInsets.all(0),
                          width: 100.0,
                          height: 30.0,
                          child: Center(child: Text('Da dat',textAlign: TextAlign.center,),),
                          decoration: const BoxDecoration(
                              color: Colors.green
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(0),
                          padding: EdgeInsets.all(0),
                          width: 100.0,
                          height: 30.0,
                          child: Center(child: Text('0 VND',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(0),
                          padding: EdgeInsets.all(0),
                          width: 100.0,
                          height: 30.0,
                          child: Center(child: Text('Da dat',textAlign: TextAlign.center,),),
                          decoration: BoxDecoration(
                              color: Colors.yellow
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(0),
                          padding: EdgeInsets.all(0),
                          width: 100.0,
                          height: 30.0,
                          child: Center(child: Text('0 VND',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
      ,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () => print('hello'),
                child: Container(
                  height: 50.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    border: new Border.all(color: Colors.white, width: 2.0),
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: new Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.list_alt,
                            color: Colors.white,
                          ),
                          new Text(
                            'Xem doanh số',
                            style:
                            new TextStyle(fontSize: 18.0, color: Colors.white),
                          )
                        ],
                      )),
                ),
              ),
            ),
            Expanded(
                child: InkWell(
                  onTap: () => print('hello'),
                  child: Container(
                    height: 50.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      border: new Border.all(color: Colors.white, width: 2.0),
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: new Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.input_rounded,
                              color: Colors.white,
                            ),
                            new Text(
                              'Nhập doanh số',
                              style: new TextStyle(fontSize: 18.0, color: Colors.white),
                            )
                          ],
                        )),
                  ),
                ))
          ],
        ),
      ),
      drawer: GalleryDrawer(),
    );
  }

  void _getSizes() {
    final renderBoxRed = _keyRed.currentContext!.findRenderObject();
    final sizeRed = renderBoxRed!.paintBounds.size;
    print("SIZE of Red: $sizeRed");
    setState(() {
      containerSize = sizeRed.toString();
    });
  }
}
