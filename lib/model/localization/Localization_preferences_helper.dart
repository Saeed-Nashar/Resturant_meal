
import 'package:shared_preferences/shared_preferences.dart';


class LocalizationPreferencesHelper {
  Future<void> setLanguage(String lang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', lang);
  }

  Future<String?> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('lang');
  }
}