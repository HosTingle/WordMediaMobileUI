import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';
class UserService{
  Future<List<User>> fetchuserData(int id) async {
    String base="https://10.0.2.2:7172/api";
    print("fetch called");
    String url="$base/Users/${id}GetByUserWithOtherId";
    final uri= Uri.parse(url);
    final response=await http.get(uri);
    if (response.statusCode == 200) {
      // API yanıtı başarılı ise
      final List<dynamic> parsedList = json.decode(response.body);
      List<User> userList = parsedList.map((map) => User.fromJson(map)).toList();
      print("completed");
      return userList;
    } else {
      // Hata durumu ile başa çıkma
      throw Exception('Failed to load data from the API');
    }
  }
}