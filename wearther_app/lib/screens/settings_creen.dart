import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wearther_app/blocs/settings_bloc.dart';
import 'package:wearther_app/events/setting_event.dart';
import 'package:wearther_app/states/settings_state.dart';

class SettingsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          BlocBuilder<SettingsBloc,SettingsState>(
              builder: (context, settingsState){
                return ListTile(
                  title: Text('Temperature Unit'),
                  isThreeLine: true,
                  subtitle: Text(
                    settingsState.temperatureUnit==TemperatureUnit.celsius?'Celsius':'Fahrenheit'
                  ),
                  trailing: Switch(
                    value: settingsState.temperatureUnit==TemperatureUnit.celsius,
                    onChanged:(_){
                      BlocProvider.of<SettingsBloc>(context).add(SettingsEventToggleUnit());
                    } ,
                  ),
                );
          })
        ],
      ),
    );
  }
}