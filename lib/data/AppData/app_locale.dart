import 'package:flutter/cupertino.dart';

class AppLocale {
  static ValueNotifier<Locale> appLocale = ValueNotifier(const Locale('en'));

  ///shared pref will be connected later on
  static toggleLocale() {
    appLocale.value =
        Locale(appLocale.value.languageCode == 'en' ? 'en' : 'ar');
  }

  static changeLocale(Locale locale) {
    appLocale.value = locale;
  }
}
