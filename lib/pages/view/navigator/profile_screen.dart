import 'package:flutter/material.dart';
import 'package:wordmedia/base/color_data.dart';
import 'package:wordmedia/base/resizer/fetch_pixels.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor,
      body: Column(
        children: [
          SizedBox(height: FetchPixels.getPixelHeight(20),),
          Text("Profile",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: FetchPixels.getPixelHeight(20)
          ),),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.11,
              width: MediaQuery.of(context).size.height * 0.11,
              child: ClipOval(
                child: Image(
                  image: AssetImage("images/okanfa.jpeg"),
                  fit: BoxFit.cover, // Bu satır, resmi konteynerin boyutlarına göre kırpmak için kullanılır
                ),
              ),
            ),
          ),
          SizedBox(height: FetchPixels.getPixelHeight(6),),
          Text("Johny Roy"),
          SizedBox(height: FetchPixels.getPixelHeight(6),),
          CustomButtonn(onPressed: (){
          }, text: "Edit Profile"),
          SizedBox(height: FetchPixels.getPixelHeight(18),),
          Padding(
            padding:  EdgeInsets.only(left:30,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Permession",style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(FetchPixels.getPixelWidth(15)),
            child: Container(
              decoration: BoxDecoration(
                  color: whiteGroundColor,
                  borderRadius: BorderRadius.all(
                      Radius.circular(FetchPixels.getPixelWidth(20)))
              ),
              height: FetchPixels.height/4,
              width: FetchPixels.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WidthBar(
                    text: "Profile",
                    icon: Icons.person_outline,
                    onPressed: (){
                    },
                  ),
                  WidthBar(
                    text: "Notification",
                    icon: Icons.notifications_none_outlined,
                    onPressed: (){
                    },
                  ),
                  WidthBar(
                    text: "Security",
                    icon: Icons.lock_outline,
                    onPressed: (){
                    },
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: FetchPixels.getPixelWidth(30),),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Acces",style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(FetchPixels.getPixelWidth(15)),
            child: Container(
              height: FetchPixels.height/6,
              width: FetchPixels.width,
              decoration: BoxDecoration(
                color: whiteGroundColor,
                borderRadius: BorderRadius.all(
                    Radius.circular(FetchPixels.getPixelWidth(20)))
              ),
              child: Column(
                children: [
                  WidthBar(
                    text: "About Us",
                    icon: Icons.info_outline,
                    onPressed: (){

                    },
                  ),
                  WidthBar(
                    text: "Logout",
                    icon: Icons.arrow_circle_left_outlined,
                    onPressed: (){

                    },
                  ),
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }

}

class WidthBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  const WidthBar({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  onPressed,
      child: Padding(
        padding: EdgeInsets.all(FetchPixels.getPixelWidth(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                   height: FetchPixels.getPixelHeight(40),
                  width: FetchPixels.getPixelWidth(40),
                  decoration: BoxDecoration(
                      color: greyColor,
                      borderRadius: BorderRadius.all(
                          Radius.circular(FetchPixels.getPixelWidth(8)))
                  ),
                  child: Icon(
                    icon
                  ),
                ),
                SizedBox(width: FetchPixels.getPixelWidth(15),),
                Text(text,style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
              ],
            ),
            Icon(Icons.keyboard_arrow_right_sharp,size: FetchPixels.getPixelWidth(30),)
          ],
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
        height: FetchPixels.getPixelHeight(53),
        width: FetchPixels.getPixelWidth(120),
        decoration: BoxDecoration(
            color: whiteGroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
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
