import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pg_app/share/format_contanst.dart';

class ChangePassword extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChangePasswordSate();
  }

}
class _ChangePasswordSate extends State<ChangePassword>{
  TextEditingController _oldPassword= new TextEditingController();
  TextEditingController _newPassword= new TextEditingController();
  TextEditingController _confirmPassword= new TextEditingController();
  bool _obscureNewPassText = true;
  Color _obscureNewPassColor = Colors.black45;
  bool _obscureOldPassText = true;
  Color _obscureOldPassColor = Colors.black45;
  bool _obscureConfirmPassText = true;
  Color _obscureConfirmPassColor = Colors.black45;

  void _toggle(int changeItem) {
    setState(() {
      if(changeItem==1){
        _obscureOldPassText = !_obscureOldPassText;
        if(_obscureOldPassText==true){
          _obscureOldPassColor = Colors.black45;
        }else{
          _obscureOldPassColor = Colors.blue;
        }
      }else if(changeItem==2){
        _obscureNewPassText = !_obscureNewPassText;
        if(_obscureNewPassText==true){
          _obscureNewPassColor = Colors.black45;
        }else{
          _obscureNewPassColor = Colors.blue;
        }
      }else{
        _obscureConfirmPassText = !_obscureConfirmPassText;
        if(_obscureConfirmPassText==true){
          _obscureConfirmPassColor = Colors.black45;
        }else{
          _obscureConfirmPassColor = Colors.blue;
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Doi mat khau'),
      )
      ,
      body: Container(
        margin: const EdgeInsets.only(left: FormatContains.MarginLeftContain, right: FormatContains.MarginRightContain, top: FormatContains.MarginTopContain),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Container(
                child: TextField(
                  controller: _oldPassword,
                  obscureText: _obscureOldPassText,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Old password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye, color:_obscureOldPassColor,),
                      onPressed: (){
                        _toggle(1);
                      },
                    ),
                  ),
                ),
              ),
              Container(
                child: TextField(
                  controller: _newPassword,
                  obscureText: _obscureNewPassText,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'New password',
                    prefixIcon: Icon(Icons.fiber_new_rounded),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye, color:_obscureNewPassColor,),
                      onPressed: (){
                        _toggle(2);
                      },
                    ),
                  ),
                ),
              ),
              Container(
                child: TextField(
                  onChanged: (text){
                    print(text);
                  },
                  controller: _confirmPassword,
                  obscureText: _obscureConfirmPassText,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'confirm password',
                    prefixIcon: Icon(Icons.assignment_turned_in_sharp),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye, color:_obscureConfirmPassColor,),
                      onPressed: (){
                        _toggle(3);
                      },
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                width: 300.0,
                child: FlatButton(
                  child: Center(
                    child: Text(
                      'Doi mat khau',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25.0)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
