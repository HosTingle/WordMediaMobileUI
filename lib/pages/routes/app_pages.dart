import 'package:flutter/cupertino.dart';
import 'package:wordmedia/pages/view/login/splash_screen.dart';
import '../view/login/initial_screen.dart';
import '../view/login/login_screen.dart';
import '../view/login/register_screen.dart';
import '../view/navigator/bottom_navigator_screen.dart';
import '../view/word_reels.dart';
import 'app_routes.dart';

class AppPages extends ChangeNotifier {
   String initialRoute = Routes.initialRoute;
   Map<String, WidgetBuilder> routes = {
     Routes.initialRoute: (context) => const InitialScreen(),
     Routes.loginRoute: (context) => const LoginScreen(),
     Routes.registerRoute: (context) => const RegisterScreen(),
     Routes.navigatorRoute:(context)=>BottomNavigators(),
     Routes.wordreelRoute:(context)=>const WordReelScreen(),
     Routes.splashRoute:(context)=>SplashScreen()
  };
}
