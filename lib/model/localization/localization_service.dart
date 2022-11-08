

import 'Localization_preferences_helper.dart';


class LocalizationService {

  final LocalizationPreferencesHelper _preferencesHelper;
  LocalizationService(this._preferencesHelper);

  Future<void> setLanguage(String lang) async {
    await _preferencesHelper.setLanguage(lang);

  }

  Future<String?> getLanguage() async {
    String? lang = await _preferencesHelper.getLanguage();
    return lang;
  }


}