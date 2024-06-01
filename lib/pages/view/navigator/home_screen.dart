import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wordmedia/base/color_data.dart';
import 'package:wordmedia/base/resizer/fetch_pixels.dart';
import '../../../base/constant.dart';
import '../../routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
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
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    if(username==null){
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
                  SizedBox(height: FetchPixels.getPixelHeight(20),),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.height * 0.08,
                    child: ClipOval(
                      child: Image(
                        image: AssetImage("images/okanfa.jpeg"),
                        fit: BoxFit.cover, // Bu satır, resmi konteynerin boyutlarına göre kırpmak için kullanılır
                      ),
                    ),
                  ),
                  SizedBox(height: FetchPixels.getPixelHeight(10),),
                  Text( username!,style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 10
                  ),),
                  Text("Words Data",style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: FetchPixels.getPixelHeight(20),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text("12",style: TextStyle(
                              fontSize: FetchPixels.getPixelWidth(20)
                          ),),
                          Text("Learn",style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                      Column(
                        children: [
                          Text("21",style: TextStyle(
                              fontSize: FetchPixels.getPixelWidth(20)
                          ),),
                          Text("Know",style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                      Column(
                        children: [
                          Text("57",style: TextStyle(
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
                      CardContainer(),
                      CardContainer(),
                      CardContainer(),
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
  const CardContainer({
    super.key,
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

    );
  }
}
