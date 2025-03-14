import 'package:driver_app/export.dart';

class LoginTextfieldController extends ChangeNotifier {
  LoginTextfieldController._privateConstructor();
  static final LoginTextfieldController _instance = LoginTextfieldController._privateConstructor();
  static LoginTextfieldController get instance => _instance;


  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

}
