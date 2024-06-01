import 'package:flutter/material.dart';

import '../../../base/color_data.dart';
import '../../../base/resizer/fetch_pixels.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: greyColor,
          title: Text("dfn.",style: TextStyle(
              fontSize: FetchPixels.getPixelWidth(38),
              fontWeight: FontWeight.bold,
              color: blueColor
          ),),
          centerTitle: true,
        ),
        body:Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: FetchPixels.getPixelHeight(20),),
              Text("Register",style: TextStyle(
                color: blueColor,
                fontWeight: FontWeight.bold,
                fontSize: FetchPixels.getPixelWidth(65),
              ),),
              SizedBox(height: FetchPixels.getPixelHeight(30),),
              CustomTextField(
                obsn: false,
                hintText: 'Username',
                icon:Icons.person, controller: _usernameController,suffixicon: null,
              ),
              SizedBox(height: FetchPixels.getPixelHeight(20),),
              CustomTextField(
                obsn: false,
                hintText: 'Password',
                icon:Icons.lock, controller:_passwordController,
                suffixicon: Icons.remove_red_eye,
              ),
              SizedBox(height: FetchPixels.getPixelHeight(20),),
              CustomTextField(
                obsn: false,
                hintText: 'Email',
                icon:Icons.mail, controller: _emailController,suffixicon: null,
              ),
              SizedBox(height: FetchPixels.getPixelHeight(17),),
              CustomButtonn(onPressed: () {  },text: "Create",),
              SizedBox(height: FetchPixels.getPixelHeight(122),),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(FetchPixels.getPixelWidth(30))
                    ),
                  ),
                ),
              ),

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

  const CustomTextField({
    required this.hintText,
    required this.icon, required this.controller, required this.obsn,required this.suffixicon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: FetchPixels.getPixelWidth(350),  // Genişlik
      height: FetchPixels.getPixelHeight(90),   // Yükseklik
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
          suffixIcon: Icon(
            suffixicon,
            color: Colors.black,
            size: 18,
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
        height: FetchPixels.getPixelHeight(50),
        width: FetchPixels.getPixelWidth(280),
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
