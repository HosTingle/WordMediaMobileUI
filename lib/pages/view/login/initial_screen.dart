import 'package:flutter/material.dart';
import 'package:wordmedia/base/resizer/fetch_pixels.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../../base/color_data.dart';
import '../../../base/constant.dart';
import '../../routes/app_routes.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  SharedPreferences? prefs;
  String? token;
  String? username;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initshared();
  }
  void initshared() async{
    prefs=await SharedPreferences.getInstance();
    token=prefs?.getString("token");
    if(token!=null){
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
      username=decodedToken["Username"];
      print(username);
    }

  }
  @override
  Widget build(BuildContext context) {
    FetchPixels(context);

      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: whiteGroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: FetchPixels.width,
              height: FetchPixels.height/2,
              color: greyColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("dfn.",style: TextStyle(
                      fontSize: FetchPixels.getPixelWidth(100),
                      fontWeight: FontWeight.bold,
                      color: blueColor
                  ),),
                  SizedBox(height: FetchPixels.getPixelHeight(30),),
                ],
              ),
            ),
            Container(
              width: FetchPixels.width,
              height: FetchPixels.height/2,
              color: whiteGroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: FetchPixels.getPixelHeight(60),),
                  CustomButtonn(onPressed: () { Constant.sendToNext(context, Routes.loginRoute); },text: "Sign In",),
                  SizedBox(height: FetchPixels.getPixelHeight(40),),
                  CustomButtonn(onPressed: () { Constant.sendToNext(context, Routes.registerRoute); },text: "Create Account",),
                  SizedBox(height: FetchPixels.getPixelHeight(70),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleButton(onPressed: (){},text: "fb",),
                      CircleButton(onPressed: (){},text: "ln",),
                      CircleButton(onPressed: (){},text: "g+",),
                      CircleButton(onPressed: (){},text: "tw",)
                    ],

                  ),
                  SizedBox(height: FetchPixels.getPixelHeight(20),),
                  Text("Sign In With Another Account ?",
                    style: TextStyle(
                        fontSize: FetchPixels.getPixelWidth(13)
                    ),)
                ],
              ),
            ),

          ],
        ),
      );
    }
  }
class CustomButtonn extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  CustomButtonn({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: FetchPixels.getPixelHeight(53),
        width: FetchPixels.getPixelWidth(300),
        decoration: BoxDecoration(
            color: whiteGroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            border: Border.all(color: blueColor, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 3),
              )
            ]
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
                fontSize: FetchPixels.getPixelWidth(16),
              color: blueColor,
            ),
          ),
        ),
      ),
    );
  }
}
class CircleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  CircleButton({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 3,left: 3),
      child: InkWell(// Tıklama efekti için yuvarlak sınır
        onTap: () {

        },
        child: Container(
          decoration: BoxDecoration(
            gradient: myGradient(),
            shape:BoxShape.circle,
          ),
          width: FetchPixels.getPixelWidth(65),
          height: FetchPixels.getPixelHeight(65),
          alignment: Alignment.center,
          child: Text(text,style: TextStyle(
            color: blueColor,
            fontWeight: FontWeight.bold,
            fontSize: FetchPixels.getPixelWidth(17)
          ),),
        ),
      ),
    );
  }
}
LinearGradient myGradient() {
  // Sol üstten beyaza doğru, sağ alttan maviye doğru renk geçişi
  return LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [

      greyColor,
      whiteGroundColor, // Başlangıç renk
    ],
    stops: [0.3, 1],
  );
}
