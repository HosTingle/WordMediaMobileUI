abstract class Routes{
  static const initialRoute = Paths.initialPath;
  static const registerRoute = Paths.registerPath;
  static const loginRoute  = Paths.loginPath;
  static const navigatorRoute=Paths.navigatorPath;
  static const wordreelRoute=Paths.wordreelsPath;
  static const splashRoute=Paths.splashPath;
}
abstract class Paths {
  static const initialPath = "/";
  static const registerPath = "/RegisterScreen";
  static const loginPath = "/LoginScreen";
  static const navigatorPath="/NavigatorScreen";
  static const wordreelsPath="/WordReelScreen";
  static const splashPath="/SplashScreen";

}