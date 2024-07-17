

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../base/color_data.dart';
import '../../../base/resizer/fetch_pixels.dart';
import '../../../models/notification_model.dart';
import '../../../provider/notification_provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<ModelNotification> notificationLists = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    notificationLists = Provider.of<Notifcationdata>(context,listen: true).notificationList;
    // didChangeDependencies içinde gerekli işlemleri yapın
    // Bu örnekte notificationLists'e başka bir veri sağlanmıyor, bu yüzden burada ek bir işlem yapmanıza gerek yok.
  }


  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Scaffold(
        backgroundColor: greyColor,
      body: Container(
        color: greyColor,
        padding: EdgeInsets.symmetric(
            horizontal: FetchPixels.getPixelWidth(20)),
        child: Column(
          children: [
            notificationList()
          ],
        ),
      ));}

  Expanded notificationList() {
    return Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                primary: true,
                itemCount: notificationLists.length,
                itemBuilder: (context, index) {
                  ModelNotification modelNOtification = notificationLists[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: FetchPixels.getPixelHeight(20),),
                      Container(
                        margin:
                        EdgeInsets.only(bottom: FetchPixels.getPixelHeight(20)),
                        padding: EdgeInsets.only(
                            top: FetchPixels.getPixelHeight(20),
                            bottom: FetchPixels.getPixelHeight(20),
                            right: FetchPixels.getPixelWidth(20),
                            left: FetchPixels.getPixelWidth(20)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(FetchPixels.getPixelHeight(12)),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: Offset(0.0, 4.0)),
                          ],
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: FetchPixels.getPixelHeight(60),
                                width: FetchPixels.getPixelHeight(60),
                                padding: EdgeInsets.all(FetchPixels.getPixelHeight(13)),
                                child:const Image(
                                  image: AssetImage("images/iconre.png"),
                                  fit: BoxFit.cover, // Bu satır, resmi konteynerin boyutlarına göre kırpmak için kullanılır
                                ),
                              ),
                            ),
                            SizedBox(height: FetchPixels.getPixelWidth(14),),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        modelNOtification!.name!,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: FetchPixels.getPixelHeight(7),),
                                  Text(
                                    modelNOtification!.description!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ));
  }

}