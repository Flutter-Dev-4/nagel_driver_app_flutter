import 'dart:convert';
import 'dart:developer';

import 'package:driver_app/data/AppData/data.dart';
import 'package:driver_app/data/AppData/pref_keys.dart';
import 'package:driver_app/data/data_sources/Theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefs {
  // SharedPrefs._();

  /// reference of Shared Preferences
  static SharedPreferences? _preferences;

  /// Initialization of Shared Preferences
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  ///survey

  ///UserData stored in json
  ///userRawData will be in map<String,dynamic>
  static Future setUserLoginData({required userRawData}) async =>
      await _preferences?.setString(
          PrefsKeys.USER_KEY, jsonEncode(userRawData));

  ///store the login token when the user login
  static Future setLoginToken(String token) async =>
      await _preferences!.setString(PrefsKeys.TOKEN_KEY, token);

  ///store userName of loged In user
  static Future setUserName(String name) async =>
      await _preferences!.setString(PrefsKeys.USER_NAME, name);

  ///store userName of loged In user
  static Future setLogInWithGoogle(bool isGoogle) async =>
      await _preferences!.setBool(PrefsKeys.Google_Account, isGoogle);

  /// get the stored UserToken
  static String? getUserToken() {
    String? token = _preferences!.getString(PrefsKeys.TOKEN_KEY);

    if (token != null || token != "") {
      Data.app.token = token;
    }
    return Data.app.token;
  }

  /// get the stored UserToken
  static bool? getLogInWithGoogle() {
    Data.app.isGoogle = _preferences!.getBool(PrefsKeys.Google_Account);

    if (Data.app.isGoogle == true) {
      Data.app.isGoogle = Data.app.isGoogle;
    }
    return Data.app.isGoogle;
  }


  ///set user data
  static Future setUserData({required userRawData}) async => await _preferences!
      .setString(PrefsKeys.USER_KEY, jsonEncode(userRawData));

  ///clear the user Data from shared preferences
  static Future clearUserData() async {
    bool? stat = await _preferences!.clear();
    Data.app.token = null;
    //  Data.app.user=null;
    print(stat);
    return stat;
  }

  /// set the Theme of Application
  // static Future<void> setGetTheme() async {
  //   String? themeMode = _preferences?.getString(PrefsKeys.THEME_KEY);
  //
  //   if (themeMode != null) {
  //     if (themeMode == 'darkTheme') {
  //       CustomAppTheme.instance.setTheme(ThemeMode.dark);
  //     } else {
  //       CustomAppTheme.instance.setTheme(ThemeMode.light);
  //     }
  //   } else {
  //     await _preferences?.setString(PrefsKeys.THEME_KEY, 'lightTheme');
  //   }
  //
  //   //  return themeMode;
  // }




  /// set the locale/language user selected
  static setLocale(localeVal) async {
    await _preferences?.setString(PrefsKeys.LOCALE_KEY, localeVal);
  }


  /// set the Current/user selected location
  static setCurrentLocation(currentLocation, int index) async {
    await _preferences?.setString(PrefsKeys.CURRENT_LOCATION, currentLocation);
    await _preferences?.setInt(PrefsKeys.LOCATION_INDEX, index);
  }

  /// set the theme
  static Future<void> setCustomTheme() async {
    if (CustomAppTheme.instance.currentTheme.value == ThemeMode.light) {
      await _preferences?.setString(PrefsKeys.THEME_KEY, 'lightTheme');
    } else {
      await _preferences?.setString(PrefsKeys.THEME_KEY, 'darkTheme');
    }
  }

  ///check if it is the user first time
  static Future<bool> isFirstTimeInApp() async {
    bool? isFirstTime = _preferences?.getBool(PrefsKeys.IS_FIRST_TIME);

    if (isFirstTime != null) {
      return isFirstTime;
    } else {
      await _preferences?.setBool(PrefsKeys.IS_FIRST_TIME, false);
      return true;
    }
  }
}
