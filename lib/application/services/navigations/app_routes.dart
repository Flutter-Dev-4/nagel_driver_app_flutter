import 'package:driver_app/export.dart';

class AppRoutes {

  static Route<dynamic> generateRoute ( RouteSettings settings) {
    switch (settings.name){
      case RoutesNames.splash_screen:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case RoutesNames.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case RoutesNames.otp_verification:
        return MaterialPageRoute(builder: (_) => VerificationScreen());

      case RoutesNames.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case RoutesNames.order_details:
        return MaterialPageRoute(builder: (_) => OrderDetailsScreen());

      case RoutesNames.notification:
        return MaterialPageRoute(builder: (_) => NotificationScreen());

      case RoutesNames.profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());

      case RoutesNames.edit_profile:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());

      case RoutesNames.change_password:
        return MaterialPageRoute(builder: (_) => ChangePasswordScreen());

      case RoutesNames.order_history:
        return MaterialPageRoute(builder: (_) => OrderHistoryScreen());

      case RoutesNames.change_language:
        return MaterialPageRoute(builder: (_) => ChangeLanguageScreen());

      case RoutesNames.forget_email:
        return MaterialPageRoute(builder: (_) => ForgetEmailScreen());

      case RoutesNames.new_password:
        return MaterialPageRoute(builder: (_) => NewPasswordScreen());


      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }

}