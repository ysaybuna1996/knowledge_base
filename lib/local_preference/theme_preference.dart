import 'package:shared_preferences/shared_preferences.dart';

class GetPreferences {

  Future getThemePreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool("dark_mode") ?? false;
  }

  void updateThemePreference(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool("dark_mode", value);
  }
}
