import 'package:driver_app/export.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en')); // Default to English

  final _settingsBox = Hive.box('settings'); // Access the Hive box

  // Change the locale and save it to Hive
  void changeLanguage(String languageCode) {
    final newLocale = Locale(languageCode);
    emit(newLocale);

    // Save the selected language to Hive
    _settingsBox.put('locale', languageCode);
    print(languageCode);
  }

  // Load the saved locale from Hive
  void loadLocaleFromHive() {
    final savedLocaleCode = _settingsBox.get('locale', defaultValue: 'en');
    emit(Locale(savedLocaleCode)); // Emit the saved locale
  }
}
