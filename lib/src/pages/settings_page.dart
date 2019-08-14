import 'package:flutter/material.dart';
import 'package:user_preferences_app/src/share_prefs/preference_user.dart';
import 'package:user_preferences_app/src/widget/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secundaryColor = true;
  int _gender;
  String _name = 'Pedro';

  TextEditingController _textController;

  final prefs = new PreferenceUser();

  @override
  void initState() {
    super.initState();
    prefs.lastPage = SettingsPage.routeName;
    _gender = prefs.gender;
    _secundaryColor = prefs.secundaryColor;
    _textController = new TextEditingController(text: prefs.nameUser);

  }

  

  _setSelectedRadio(int valor) async{
    setState(() {
      //prefs.setInt('gender', valor);
      prefs.gender = valor;
     _gender = valor; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          centerTitle: true,
          backgroundColor: (prefs.secundaryColor) ? Colors.teal : Colors.blue,

        ),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _secundaryColor,
              title: Text('Secundary Color'),
              onChanged: (value) {
                setState(() {
                  _secundaryColor = value;
                  prefs.secundaryColor = value;
                });
              },
            ),
            RadioListTile(
              value: 1,
              title: Text('Male'),
              groupValue: _gender,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
              value: 2,
              title: Text('Female'),
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value;
                  prefs.gender = value;
                });
              },
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: 'Name', helperText: 'Name of the person'),
                onChanged: (value) {
                  prefs.nameUser = value;
                },
              ),
            )
          ],
        ));
  }
}
