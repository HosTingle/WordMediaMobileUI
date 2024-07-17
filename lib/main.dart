import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wordmedia/pages/routes/app_pages.dart';
import 'package:provider/provider.dart';
import 'package:wordmedia/provider/notification_provider.dart';
import 'package:wordmedia/provider/reels_provider.dart';
import 'package:wordmedia/provider/user_provider.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  HttpOverrides.global = MyHttpOverrides();
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AppPages()),
            ChangeNotifierProvider(create: (_) => ReelsProvider()),
            ChangeNotifierProvider(create: (_) => UserProvider()),
            ChangeNotifierProvider(create: (_) => Notifcationdata())

          ],
          child: const MyApp()
      ));

}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:"/SplashScreen",
      routes: Provider.of<AppPages>(context, listen: true).routes,
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
