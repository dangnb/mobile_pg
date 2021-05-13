import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pg_app/pages/login/login_page.dart';
import 'package:pg_app/utils/store_location.dart';

import 'blocs/authentication_bloc.dart';
import 'change_password/change_password.dart';
import 'events/authentication_event.dart';

class GalleryDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          new DrawerHeader(child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset(
                    'images/profile.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                new Text('Nguyen Ba Dang'),
                new Text('SoftWare developer',style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
          ),
            decoration: BoxDecoration(
                color: Colors.blue
            ),
          ),
          ListTile(
            leading: Icon(Icons.lock_outline),
            title: Text('Đổi mật khẩu'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChangePassword()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.whatshot),
            title: Text('Lịch check in'),
          ),
          ListTile(
            leading: Icon(Icons.book_outlined),
            title: Text('Chụp ảnh địa điểm'),
          ),
          ListTile(
            leading: Icon(Icons.search_sharp),
            title: Text('Doanh số khác'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Đăng xuất'),
            onTap: () async {
              BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationEventLoggedOut());
            },
          )
        ],
      ),
    );
  }
}