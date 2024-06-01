import 'package:flutter/material.dart';
import 'package:wordmedia/base/resizer/fetch_pixels.dart';
import 'package:wordmedia/pages/view/navigator/profile_screen.dart';
import '../../../base/color_data.dart';
import 'home_screen.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
class BottomNavigators extends StatefulWidget {
  @override
  State<BottomNavigators> createState() => _BottomNavigatorsState();
}
var sayfalistesi=[HomeScreen(),ProfileScreen(),HomeScreen(),ProfileScreen()];

class _BottomNavigatorsState extends State<BottomNavigators> {
  int? index=0;
  List<IconData> itemList = [
    Icons.home_outlined,
    Icons.insert_comment_outlined,
    Icons.notifications_none_outlined,
  Icons.person_outline
  ];
  @override
  void initState() {
    super.initState();
    position = index!;
  }

  int position = 0;
  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)?.settings.arguments as String?;
    if(message!=null){
      Map<String, dynamic> decodedToken = JwtDecoder.decode(message!);
      print(decodedToken["Username"]);
      print(decodedToken["UserId"]);
    }
    return Scaffold(
      body: SafeArea(
        child: sayfalistesi[position],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: blueColor,
        shape: const CircularNotchedRectangle(),
        child:bottomNavigationBar() ,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: blueColor,
        onPressed: () {
          // Butona basıldığında gerçekleşecek işlemi belirtin
        },
        shape: const CircleBorder(),
        child: ClipOval(
          child: Icon(
            Icons.camera_sharp,
                color: Colors.white,
          )
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  Row bottomNavigationBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List<Widget>.generate(sayfalistesi.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              position = index;
            });
          },
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: FetchPixels.getPixelWidth(10),right: FetchPixels.getPixelWidth(10),),
                  child: Icon(
                    size: FetchPixels.getPixelWidth(28),
                    itemList[index],
                      color: position == index ?Colors.white : Colors.white30 ,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}