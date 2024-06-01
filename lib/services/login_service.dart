import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/login_model.dart';
class LoginService{
  String base="https://10.0.2.2:7172/api";
  Future<String> loginuser(Login log) async {
    var request={
      "username": log.username,
      "password": log.password
    };
    print("fetch called");
    String url= "$base/Login";
    final uri= Uri.parse(url);
    final response=await http.post(uri, body:jsonEncode(request),headers: {
      'Content-Type': 'application/json',
    },
    );
    print("fetch called");
    if (response.statusCode == 200) {
      var jsonresponse=jsonDecode(response.body);
      print("completed");
      if(jsonresponse['token']!=null){
        String token=jsonresponse['token'];
        return token;
      }
      else{
        return "bos";
      }
    } else {
      print("Someting went wrong");
      return "bos";
    }

  }
}