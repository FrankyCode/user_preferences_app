import 'package:flutter/material.dart';
import 'package:user_preferences_app/src/pages/home_page.dart';
import 'package:user_preferences_app/src/pages/settings_page.dart';
import 'package:user_preferences_app/src/share_prefs/preference_user.dart';
 
void main() async {

  final prefs = new PreferenceUser();
  await prefs.initPrefs();
  
  runApp(MyApp());
} 
 
class MyApp extends StatelessWidget {
final prefs = PreferenceUser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Preferences',
      debugShowCheckedModeBanner: false,
      initialRoute: prefs.lastPage,
      routes: {
          HomePage.routeName : ( BuildContext context ) => HomePage(),
          SettingsPage.routeName : ( BuildContext context ) => SettingsPage(),
      },
    );
  }
}