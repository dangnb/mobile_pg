import 'package:clean_architechture/presentation/authentication/bloc/authentication_bloc.dart';
import 'package:clean_architechture/presentation/authentication/bloc/authentication_event.dart';
import 'package:clean_architechture/presentation/change_password/change_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(decoration: const BoxDecoration(
                color: Colors.blue
            ),child: Container(
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
                const Text('Nguyen Ba Dang'),
                const Text('SoftWare developer',style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
          ),
          ),
          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text('Đổi mật khẩu'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChangePassword()),
              );
            },
          ),
          ListTile(
            onTap: (){
            },
            leading: const Icon(Icons.whatshot),
            title: const Text('Lịch check in'),
          ),
          const ListTile(
            leading: const Icon(Icons.book_outlined),
            title: const Text('Chụp ảnh địa điểm'),
          ),
          const ListTile(
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