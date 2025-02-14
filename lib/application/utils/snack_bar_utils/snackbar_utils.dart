import 'package:driver_app/export.dart';

class SnackBarUtils {

  void showTopSnackBar(BuildContext context, String message) {
    Flushbar(
      message: message,
      backgroundColor: AppColor.red,
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP, // Show at the top
      margin: EdgeInsets.all(20),
      borderRadius: BorderRadius.circular(8),
    )..show(context);
  }

}