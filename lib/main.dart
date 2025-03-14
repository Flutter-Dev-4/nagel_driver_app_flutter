import 'package:driver_app/application/DiLayer/depdency_injection.dart';
import 'package:driver_app/application/services/navigations/app_routes.dart';
import 'package:driver_app/application/utils/app_providers/app_providers.dart';
import 'package:driver_app/data/AppData/data.dart';
import 'package:driver_app/export.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Hive.initFlutter();
  await Hive.openBox('allItems');
  // Open the settings box to store language preferences
  await Hive.openBox('settings');
  await Data.app.init();
  Dependencies().initDependency();


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
        MultiBlocProvider(providers: appProviders,
            child: const MyApp())
    );
  });

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
            builder: (context, locale){
              return ScreenUtilInit(
     designSize: const Size(428, 926),
     child: MediaQuery(
       data: MediaQueryData.fromView(WidgetsBinding.instance.window)
           .copyWith(textScaler: const TextScaler.linear(1.0)), // Fix text scale factor,
       child: MaterialApp(
         locale: locale,
         supportedLocales: const [
           Locale('en'),
           Locale('ar'),
         ],
         localizationsDelegates: [
           AppLocalizations.delegate,
           GlobalMaterialLocalizations.delegate,
           GlobalWidgetsLocalizations.delegate,
           GlobalCupertinoLocalizations.delegate,
         ],
         debugShowCheckedModeBanner: false,
         title: 'Driver App',
         theme: ThemeData(
           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
           useMaterial3: true,
         ),
         initialRoute: RoutesNames.splash_screen,
         onGenerateRoute: AppRoutes.generateRoute,
       ),
     ),
              );
            });
  }
}

