import 'dart:developer';

import 'package:driver_app/data/AppData/data.dart';
import 'package:driver_app/export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      log('Here is splash Token ${Data.app.token}');
      if(Data.app.token != null && Data.app.token != ''){
        Navigator.pushNamed(context, RoutesNames.home);
      }
      else{
        Navigator.pushNamed(context, RoutesNames.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: const AssetImage(AppImages.logo4),
          width: 200.w,
        ),
      ),
    );
  }
}
