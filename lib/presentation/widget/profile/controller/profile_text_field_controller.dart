import 'package:driver_app/export.dart';

class ProfileTextFieldController extends ChangeNotifier {
  ProfileTextFieldController._privateConstructor();
  static final ProfileTextFieldController _instance = ProfileTextFieldController._privateConstructor();
  static ProfileTextFieldController get instance => _instance;


  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

}
