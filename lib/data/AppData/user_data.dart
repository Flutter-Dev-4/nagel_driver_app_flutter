
mixin UserData {
  static String? userToken;
  static String? userName;
  static String? userAge;

  // static ProfileModel? userData;
  static bool? isLoginWithGoogle;

  // static Map<String, dynamic>? userHeaderData;
  //
  // set userHeader(Map<String, dynamic>? userHeader) =>
  //     userHeaderData = userHeader;

  set token(String? token) => userToken = token;
  set name(String? name) => userName = name;
  set age(String? age) => userAge = age;
  set isGoogle(bool? isGoogle) => isLoginWithGoogle = isGoogle;

  // set user(ProfileModel? userModel) => userData = userModel;

  // ProfileModel? get user => userData;

  String? get token => userToken;
  String? get name => userName;
  String? get age => userAge;

  bool? get isGoogle => isLoginWithGoogle;

// Map<String, dynamic>? get userHeader => userHeaderData;
}
