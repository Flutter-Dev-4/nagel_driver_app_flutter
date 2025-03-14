
import 'package:driver_app/data/AppData/app_initilizer.dart';
import 'package:driver_app/data/AppData/user_data.dart';

class Data with AppInitializer, UserData {
  Data._();

  // Static instance variable
  static final Data app = Data._();

  // Getter to access the instance
  factory Data() {
    return app;
  }
}
