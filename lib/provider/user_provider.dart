import 'package:flutter/cupertino.dart';
import 'package:wordmedia/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class UserProvider extends ChangeNotifier{

  UserService userService=UserService();
  User? _user;
  List<User>? _users = [];

  List<User>? get words => _users;
  User? get user=>_user;
  void fetchuserInformation() async{
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String? userid=sharedPreferences.getString("UserId");
    /*_user=await userService.fetchuserData(1002);
    if(_words!.isEmpty){
    }
    else{
      word= _words?.last;
    }
    */
    notifyListeners();
  }


}