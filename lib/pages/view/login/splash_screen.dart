import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../base/color_data.dart';
import '../../../base/resizer/fetch_pixels.dart';
import '../../routes/app_routes.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? finaluser;
  String? finalpassword;
  @override
  void initState() {

    getValidationData().whenComplete(()async{
      Timer(
          const Duration(seconds: 2),

              () => Navigator.pushNamedAndRemoveUntil(
                context,
                finaluser==null && finalpassword==null ? Routes.initialRoute:Routes.navigatorRoute ,
                    (Route<dynamic> route) => false, // Bütün önceki rotaları kaldır
              )
      );
    });
    super.initState();
  }
  Future<void> getValidationData()async{
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    var username=sharedPreferences.getString("Username");
    var pass=sharedPreferences.getString("UserId");
    setState(() {
      finalpassword=pass;
      finaluser=username;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Container(
            height: FetchPixels.getPixelHeight(180),
            width: FetchPixels.getPixelHeight(120),
            child:Column(
              children: [
                 Image(
                  image: AssetImage("images/iconre.png"), // Bu satır, resmi konteynerin boyutlarına göre kırpmak için kullanılır
                ),
                SizedBox(height: FetchPixels.getPixelHeight(20),),
        Text("WordMedia.",style: TextStyle(
            fontSize: FetchPixels.getPixelWidth(13),
            fontWeight: FontWeight.bold,
            color: blueColor
        )
        ),
              ],
            ),
          ),),
      );
  }
}