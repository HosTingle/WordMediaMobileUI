import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wordmedia/base/color_data.dart';
import 'package:wordmedia/base/resizer/fetch_pixels.dart';
import 'package:wordmedia/provider/user_provider.dart';
import '../../../base/constant.dart';
import '../../../models/user_model.dart';
import '../../routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences? prefs;
  String? token;
  String? username;
  String? userid;
  User? user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initshared();
  }
  void initshared() async{
    prefs=await SharedPreferences.getInstance();
    token=prefs?.getString("token");
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
    userid=decodedToken["UserId"];
    print(userid);
    username=decodedToken["Username"];
    prefs?.setString('Username', username!);
    prefs?.setString('UserId', userid!);


  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    user=Provider.of<UserProvider>(context, listen: true).user;

  }
  @override
  Widget build(BuildContext context) {
    if(user?.learned==null){
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );

    }
    else{
      return Scaffold(
        backgroundColor: greyColor,
        body: Column(
          children: [
            Container(
              height: FetchPixels.height*1/4,
              width: FetchPixels.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(FetchPixels.getPixelWidth(50))
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: FetchPixels.getPixelHeight(80),),
                  Text("Words İnformation",style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: FetchPixels.getPixelHeight(40),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(user!.learnword.toString(),style: TextStyle(
                              fontSize: FetchPixels.getPixelWidth(20)
                          ),),
                          Text("Learn",style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                      Column(
                        children: [
                          Text(user!.knowword.toString(),style: TextStyle(
                              fontSize: FetchPixels.getPixelWidth(20)
                          ),),
                          Text("Know",style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                      Column(
                        children: [
                          Text(user!.learned.toString(),style: TextStyle(
                              fontSize: FetchPixels.getPixelWidth(20)
                          ),),
                          Text("Learned",style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),)
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: FetchPixels.width,
              color: greyColor,
              child: Column(
                children: [
                  SizedBox(height: FetchPixels.getPixelHeight(50),),
                  GestureDetector(
                    onTap: (){
                      Constant.sendToNext(context, Routes.wordreelRoute);
                    },
                    child: Container(
                      height: FetchPixels.getPixelHeight(150),
                      width: FetchPixels.getPixelWidth(150),
                      child: ClipOval(
                        child: Container(
                          color: whiteGroundColor,
                          child: Center(
                            child: Text(
                              "Start",style: TextStyle(
                                fontSize: FetchPixels.getPixelWidth(30)
                            ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: FetchPixels.getPixelHeight(80),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CardContainer(text1: "Spent Time",text2: "0",),
                      CardContainer(text1: "Total Words ",text2: "0",),
                      CardContainer(text1: "Weekly login",text2: "0",),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

  }
}

class CardContainer extends StatelessWidget {
  final String text1;
  final String text2;
  const CardContainer({
    super.key,
  required this.text1, required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: FetchPixels.getPixelHeight(150),
      width: FetchPixels.getPixelHeight(120),
      decoration: BoxDecoration(
        color: blueColor, // Arka plan rengini buradan ayarlayabilirsiniz
        borderRadius: BorderRadius.circular(12.0), // Köşe yuvarlatma derecesi
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(text1,style: TextStyle(
            color: whiteGroundColor
          ),),
          Text(text2,style: TextStyle(
              color: whiteGroundColor
          ),),
        ],
      ),

    );
  }
}
