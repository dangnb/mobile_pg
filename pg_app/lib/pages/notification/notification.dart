import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThongBao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Thong bao'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: ListTile(
                title: Container(
                  height: 50.0,
                  child: Center(child: Text('Gui tu: admin luc 11h20 phut',style: TextStyle(fontWeight: FontWeight.bold),),),
                  decoration: BoxDecoration(
                    color: Colors.green
                  ),
                ),
                subtitle: Container(
                  child: Text(
                    'Nổ tàu dầu ngoài khơi Syria, thông tin đang cập nhật liên tục - Israel báo động lực lượng quân đội lớn chưa từng có trong lịch sử',
                    style: TextStyle(fontSize: 15),),
                  decoration: BoxDecoration(
                      color: Colors.teal
                  ),
                )
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200.0)
              ),
            ),
            Container(
              child: ListTile(
                  title: Container(
                    height: 50.0,
                    child: Center(child: Text('Gui tu: admin luc 11h20 phut',style: TextStyle(fontWeight: FontWeight.bold),),),
                    decoration: BoxDecoration(
                        color: Colors.green
                    ),
                  ),
                  subtitle: Container(
                    child: Text(
                      'Nổ tàu dầu ngoài khơi Syria, thông tin đang cập nhật liên tục - Israel báo động lực lượng quân đội lớn chưa từng có trong lịch sử',
                      style: TextStyle(fontSize: 15),),
                    decoration: BoxDecoration(
                        color: Colors.teal
                    ),
                  )
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200.0)
              ),
            )
          ],
        ),
      ),
    );
  }
}
