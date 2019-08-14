import 'package:shared_preferences/shared_preferences.dart';


class PreferenceUser{

  static final PreferenceUser _instance = new PreferenceUser._internal();

  factory PreferenceUser(){
    return _instance;
  }

  PreferenceUser._internal();


  SharedPreferences _prefs;

  initPrefs() async{
     this._prefs = await SharedPreferences.getInstance();

  }

  // GET and SET of Gender
  get gender {
    return _prefs.getInt('gender') ?? 1;
  }

  set gender(int value){
      _prefs.setInt('gender', value);
  }


   // GET and SET of SecundaryColor
  get secundaryColor {
    return _prefs.getBool('secundaryColor') ?? false;
  }

  set secundaryColor(bool value){
      _prefs.setBool('secundaryColor', value);
  }

    // GET and SET of nameUser
  get nameUser {
    return _prefs.getString('nameUser') ?? '';
  }

  set nameUser(String value){
      _prefs.setString('nameUser', value);
  }

     // GET and SET of lastPage
  get lastPage {
    return _prefs.getString('lastPage') ?? 'home';
  }

  set lastPage(String value){
      _prefs.setString('lastPage', value);
  }

}