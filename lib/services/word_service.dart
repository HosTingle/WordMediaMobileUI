import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/word_model.dart';
class WordService{
  Future<List<Word>> fetchWordbyid(int id) async {
    String base="https://10.0.2.2:7172/api";
    print("fetch called");
    String url="$base/UserWords/GetAllWordsbyUserId?id=$id";
    final uri= Uri.parse(url);
    final response=await http.get(uri);
    if (response.statusCode == 200) {
      // API yanıtı başarılı ise
      final List<dynamic> parsedList = json.decode(response.body);
      List<Word> wordsList = parsedList.map((map) => Word.fromJson(map)).toList();

      print("completed");
      return wordsList;
    } else {
      // Hata durumu ile başa çıkma
      throw Exception('Failed to load data from the API');
    }
  }
  Future<List<Word>> fetchallwords() async {
    String base="https://10.0.2.2:7172/api";
    print("fetch called");
    String url="$base/Word/getallWord";
    final uri= Uri.parse(url);
    final response=await http.get(uri);
    if (response.statusCode == 200) {
      // API yanıtı başarılı ise
      final List<dynamic> parsedList = json.decode(response.body);
      List<Word> wordsList = parsedList.map((map) => Word.fromJson(map)).toList();
      print("completed");
      return wordsList;
    } else {
      // Hata durumu ile başa çıkma
      throw Exception('Failed to load data from the API');
    }
  }
}