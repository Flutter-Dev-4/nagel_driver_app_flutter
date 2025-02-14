import 'package:driver_app/export.dart';

extension SizeExtensions on num {

  SizedBox get x => SizedBox(width: toDouble().w);

  SizedBox get y => SizedBox(height: toDouble().h);

}

extension TextStyleExtension on TextStyle {
  TextStyle anyFamily(double size, FontWeight fontWeight) =>
      TextStyle(fontSize: size, fontWeight: fontWeight);
}

extension TextExtension on Text {
  Text text(String text, double size, FontWeight fontWeight) => Text(
        text,
        style: TextStyle(fontSize: size, fontWeight: fontWeight),
      );
}

extension PaddingExtension on Widget {
  Widget paddingAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Widget paddingVertical(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: value),
      child: this,
    );
  }

  Widget paddingHorizontal(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value),
      child: this,
    );
  }
}

extension TextExtensionss on String {
  Text txt(double fontSize, FontWeight fontWeight) => Text(
        toString(),
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      );
}