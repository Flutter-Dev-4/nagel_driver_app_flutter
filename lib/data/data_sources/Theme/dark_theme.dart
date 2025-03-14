import 'package:driver_app/data/data_sources/Colors/dark_colors_palate.dart';
import 'package:driver_app/data/data_sources/Styles/app_textstyles.dart';
import 'package:driver_app/export.dart';

mixin CustomDarkTheme {
  ThemeData darkTheme() => ThemeData(
      datePickerTheme: datePickerDialogTheme(),
      colorScheme: colorScheme,
      // listTileTheme: listTileTheme(),
      textTheme: textTheme(),
      // scrollbarTheme: ScrollbarThemeData(
      //     thumbVisibility: const WidgetStatePropertyAll(false),
      //     thickness: const WidgetStatePropertyAll(4),
      //     thumbColor: WidgetStatePropertyAll(
      //         DarkColorsPalate.tertiaryColor.withOpacity(0.5))),
      buttonTheme: buttonTheme,
      appBarTheme: appBarTheme(),
      iconTheme: iconTheme,
      inputDecorationTheme: inputDecorationTheme(),
      bottomNavigationBarTheme: bottomNavigationBarTheme,
      dialogTheme: dialogTheme(),
      radioTheme: radioTheme(),
      checkboxTheme: checkboxTheme(),
      chipTheme: chipThemeData());

  // CheckBox Theme
  CheckboxThemeData checkboxTheme() => CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        side: const BorderSide(color: Colors.white),
        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return DarkColorsPalate.secondaryColor;
          }
          return Colors.transparent;
        }),
        checkColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return DarkColorsPalate.tertiaryColor;
          }
          return Colors.transparent;
        }),
        overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.green.withOpacity(0.5);
          }
          return Colors.red.withOpacity(0.5);
        }),
      );

  // Radio Button Theme
  RadioThemeData radioTheme() => RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return DarkColorsPalate.secondaryColor;
          }
          return DarkColorsPalate.tertiaryColor;
        }),
        overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return DarkColorsPalate.secondaryColor;
          }
          return DarkColorsPalate.tertiaryColor;
        }),
      );

  // Color Scheme Theme
  static ColorScheme colorScheme = const ColorScheme(
    brightness: Brightness.dark,
    onPrimary: DarkColorsPalate.tertiaryColor,
    primary: DarkColorsPalate.primaryColor,
    secondary: DarkColorsPalate.secondaryColor,
    onError: DarkColorsPalate.tertiaryColor,
    outline: DarkColorsPalate.boxOutlineDarkColor,
    onInverseSurface: DarkColorsPalate.disableButtonColor,
    onPrimaryContainer: DarkColorsPalate.whiteColor,
    onSurfaceVariant: DarkColorsPalate.sheetGred2,
    tertiary: DarkColorsPalate.tertiaryColor,
    primaryContainer: DarkColorsPalate.primaryColor,
    onSecondary: DarkColorsPalate.tertiaryColor,
    error: DarkColorsPalate.errorColor,
    onSecondaryContainer: DarkColorsPalate.cardGred2,
    outlineVariant: DarkColorsPalate.boxOutlineDarkColor,
    surface: DarkColorsPalate.surfaceColor,
    onSurface: DarkColorsPalate.tertiaryColor,
    background: DarkColorsPalate.surfaceColor,
    onBackground: DarkColorsPalate.tertiaryColor,
  );

  // Chip Theme
  static ChipThemeData chipThemeData() => ChipThemeData(
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 11),
        // selectedColor: DarkColorsPalate.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(42),
          side: const BorderSide(color: DarkColorsPalate.boxOutlineDarkColor),
        ),
        brightness: Brightness.dark,
        labelStyle: AppTextStyles.regular(),
      );

  // Input Field Theme
  static InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      hintStyle: AppTextStyles.regular(
          color: DarkColorsPalate.tertiaryColor.withOpacity(0.3),
          fontWeight: FontWeight.w400),
      fillColor: DarkColorsPalate.fieldFillColor,
      filled: true,
      suffixIconColor: DarkColorsPalate.tertiaryColor,
      prefixIconColor: DarkColorsPalate.tertiaryColor,
      border: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 0, color: DarkColorsPalate.tertiaryColor),
          borderRadius: BorderRadius.circular(52)),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: DarkColorsPalate.tertiaryColor),
          borderRadius: BorderRadius.circular(52)),
      disabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: DarkColorsPalate.disableButtonColor),
          borderRadius: BorderRadius.circular(52)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: DarkColorsPalate.tertiaryColor),
          borderRadius: BorderRadius.circular(52)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: DarkColorsPalate.errorColor),
          borderRadius: BorderRadius.circular(52)),
    );
  }

  // bottom Navigation Bar Theme

  static BottomNavigationBarThemeData bottomNavigationBarTheme =
      const BottomNavigationBarThemeData(
    unselectedItemColor: DarkColorsPalate.tertiaryColor,
    selectedItemColor: DarkColorsPalate.secondaryColor,
  );

  // Dialog Theme
  static DialogTheme dialogTheme() {
    return DialogTheme(
      iconColor: DarkColorsPalate.secondaryColor,
      backgroundColor: DarkColorsPalate.primaryColor,
      alignment: Alignment.center,
      titleTextStyle: AppTextStyles.bold(),
      contentTextStyle: AppTextStyles.regular(fontSize: 16),
      shape: RoundedRectangleBorder(
        // side: const BorderSide(color: DarkColorsPalate.tertiaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  static DatePickerThemeData datePickerDialogTheme() {
    return DatePickerThemeData(
      inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            color: DarkColorsPalate.tertiaryColor,
          ),
          labelStyle: TextStyle(
            color: DarkColorsPalate.tertiaryColor,
          )),
      headerBackgroundColor: DarkColorsPalate.primaryColor,
      headerForegroundColor: DarkColorsPalate.tertiaryColor,
      cancelButtonStyle: const ButtonStyle(
          foregroundColor:
              MaterialStatePropertyAll(DarkColorsPalate.tertiaryColor)),
      confirmButtonStyle: const ButtonStyle(
          foregroundColor:
              MaterialStatePropertyAll(DarkColorsPalate.tertiaryColor)),
      backgroundColor: DarkColorsPalate.primaryColor,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: DarkColorsPalate.tertiaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  //Appbar Theme
  static AppBarTheme appBarTheme() {
    return AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: AppTextStyles.regular(),
    );
  }

  // Icon Theme
  static IconThemeData iconTheme = const IconThemeData(size: 24);

  //Button Theme
  static ButtonThemeData buttonTheme = const ButtonThemeData(
    buttonColor: Colors.transparent,
    disabledColor: DarkColorsPalate.disableButtonColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(60)),
    ),
  );

  // TextStyle Theme
  static TextTheme textTheme() => TextTheme(
      //Bold Style
      headlineLarge: AppTextStyles.bold(fontSize: 26),
      headlineMedium: AppTextStyles.bold(fontSize: 20),
      headlineSmall: AppTextStyles.bold(),

      //Medium Style
      titleLarge: AppTextStyles.medium(fontSize: 22),
      titleMedium: AppTextStyles.medium(fontSize: 18),
      titleSmall: AppTextStyles.medium(),

      //Regular Style
      bodyLarge: AppTextStyles.regular(
          fontSize: 16, color: DarkColorsPalate.tertiaryColor.withOpacity(0.3)),
      bodyMedium: AppTextStyles.regular(
          fontSize: 14, color: DarkColorsPalate.tertiaryColor.withOpacity(0.8)),
      bodySmall: AppTextStyles.regular(
          color: DarkColorsPalate.tertiaryColor.withOpacity(0.8)));
}
