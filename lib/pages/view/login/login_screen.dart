import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordmedia/base/color_data.dart';
import 'package:wordmedia/base/resizer/fetch_pixels.dart';
import 'package:wordmedia/models/login_model.dart';
import 'package:wordmedia/services/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool iconbol=true;
  SharedPreferences? prefs;
  LoginService loginService=LoginService();
  Login userlogin=Login();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initshared();

  }
  void initshared() async{
    prefs=await SharedPreferences.getInstance();

  }
  void login() async{
    userlogin.username = _usernameController.text;
    userlogin.password = _passwordController.text;
    String token=await loginService.loginuser(userlogin);
    prefs?.setString('token', token);
    if(token!=null){
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.navigatorRoute,
            (Route<dynamic> route) => false, // Bütün önceki rotaları kaldır
          arguments: token
      );
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: greyColor,
        title: Text("WordMedia.",style: TextStyle(
            fontSize: FetchPixels.getPixelWidth(38),
            fontWeight: FontWeight.bold,
            color: blueColor
        ),),
        centerTitle: true,
      ),
      body:SizedBox(
        width: FetchPixels.width,
        height: FetchPixels.height,
        child: Column(
          children: [
            SizedBox(height: FetchPixels.getPixelHeight(40),),
            Text("Login",style: TextStyle(
              color: blueColor,
              fontWeight: FontWeight.bold,
              fontSize: FetchPixels.getPixelWidth(80),
            ),),
            SizedBox(height: FetchPixels.getPixelHeight(20),),
            CustomTextField(
              onPressed: (){

              },
              obsn: false,
              hintText: 'Username',
              icon:Icons.person, controller: _usernameController,suffixicon: null,
            ),
            SizedBox(height: FetchPixels.getPixelHeight(20),),
            CustomTextField(
              onPressed: () {
                setState(() {
                  iconbol = !iconbol;
                });
              },
              obsn: iconbol,
              hintText: 'Password',
              icon: Icons.lock,
              controller: _passwordController,
              suffixicon: iconbol
                  ? Icons.remove_red_eye
                  : Icons.remove_red_eye_outlined,
            ),
            SizedBox(height: FetchPixels.getPixelHeight(17),),
            CustomButtonn(onPressed: () {
              login();
            },text: "Sign In",),
            SizedBox(height: FetchPixels.getPixelHeight(14),),
            Text("Forgot Your Password?",style: TextStyle(
              color: blueColor
            ),),
            SizedBox(height: FetchPixels.getPixelHeight(84),),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: greyColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(FetchPixels.getPixelWidth(30))
                  ),
                  ),
              ),
            )

          ],
        ),
      )

    );
  }
}
class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final bool obsn;
  final IconData? suffixicon;
  final VoidCallback? onPressed;

  const CustomTextField({
    required this.hintText,
    required this.icon,
    required this.controller,
    required this.obsn,
    required this.suffixicon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: FetchPixels.getPixelWidth(350), // Genişlik
      height: FetchPixels.getPixelHeight(90), // Yükseklik
      child: TextField(
        obscureText: obsn,
        controller: controller,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: whiteGroundColor,
          hintText: hintText,
          prefixIcon: Icon(
            icon,
            color: Colors.black,
            size: 18,
          ),
          suffixIcon: GestureDetector(
            onTap: onPressed,
            child: Icon(
              suffixicon,
              color: Colors.black,
              size: 18,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        ),
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
        height: FetchPixels.getPixelHeight(52),
        width: FetchPixels.getPixelWidth(280),
        decoration: BoxDecoration(
            color: whiteGroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
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