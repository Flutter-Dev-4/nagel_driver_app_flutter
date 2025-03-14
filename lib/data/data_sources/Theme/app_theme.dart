import 'package:driver_app/data/data_sources/Theme/dark_theme.dart';
import 'package:driver_app/export.dart';

class CustomAppTheme with CustomDarkTheme {
  CustomAppTheme._();

  static final CustomAppTheme instance = CustomAppTheme._();

  factory CustomAppTheme() => instance;

  ValueNotifier<ThemeMode> currentTheme = ValueNotifier(ThemeMode.dark);
}
