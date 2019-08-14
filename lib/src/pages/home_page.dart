import 'package:flutter/material.dart';
import 'package:user_preferences_app/src/share_prefs/preference_user.dart';
import 'package:user_preferences_app/src/widget/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new PreferenceUser();

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = HomePage.routeName;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('User Preferences'),
        backgroundColor: (prefs.secundaryColor) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Secundary Color: ${ prefs.secundaryColor }'),
          Divider(),
          Text('Gender: ${prefs.gender}'),
          Divider(),
          Text('User Name: ${prefs.nameUser} '),
          Divider()
        ],
      ),
    );
  }

  
}
