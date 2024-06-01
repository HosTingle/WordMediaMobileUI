import 'package:flutter/material.dart';
import 'package:wordmedia/services/word_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/word_model.dart';

class ReelsProvider extends ChangeNotifier {

  WordService wordService=WordService();
  Word? word;
  List<Word>? _words = [];

  List<Word>? get words => _words;
  ReelsProvider() {
    fetchuserWords();
  }
  void fetchuserWords() async{
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String? userid=sharedPreferences.getString("UserId");
    _words=await wordService.fetchWordbyid(int.parse(userid!));
    if(_words!.isEmpty){
    }
    else{
      word= _words?.last;
    }
    notifyListeners();
  }
}