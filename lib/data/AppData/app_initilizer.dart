

import 'package:driver_app/application/services/SharedPreferences/app_preferences.dart';

mixin AppInitializer {
  Future init() async {
    Future.wait([
      _user(),
    ]);
  }

  static Future _user() async {
    await SharedPrefs.init();
    await SharedPrefs.getUserToken();

  }
}
