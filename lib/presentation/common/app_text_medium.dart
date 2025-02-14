import 'package:driver_app/export.dart';

class AppTextMedium extends StatelessWidget {

  final String title;
  final FontWeight? fontWeight;
  final double fontSize;
  final Color? color;
  final TextAlign? textAlign;

  const AppTextMedium({
    super.key,
    required this.title,
    this.fontWeight,
    required this.fontSize,
    this.color,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'SFPRODISPLAYMEDIUM',
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}
