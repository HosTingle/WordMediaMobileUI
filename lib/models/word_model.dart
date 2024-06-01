class Word {
 int? wordforuserid;
 int? userid;
 String? word;
 String? wordtranslate;
 String? sentence;
 String? descriptionword;
 String? wordlevel;
 int? languageid;
 String? typeofword;
 int? wordcounter;

 Word({
  this.wordforuserid,
  this.userid,
  this.word,
  this.wordtranslate,
  this.sentence,
  this.descriptionword,
  this.wordlevel,
  this.languageid,
  this.typeofword,
  this.wordcounter,
 });

 Word.fromJson(Map<String, dynamic> json) {
  wordforuserid = json['wordforuserid']?.toInt();
  userid= json['userid']?.toInt();
  word = json['word']?.toString();
  wordtranslate = json['wordtranslate']?.toString();
  sentence = json['sentence']?.toString();
  descriptionword = json['descriptionword']?.toString();
  wordlevel = json['wordlevel']?.toString();
  languageid = json['languageid']?.toInt();
  typeofword = json['typeofword']?.toString();
  wordcounter = json['wordcounter']?.toInt();
 }

 Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = {};
  data['wordforuserid'] = wordforuserid;
  data['userid']=userid;
  data['word'] = word;
  data['wordtranslate'] = wordtranslate;
  data['sentence'] = sentence;
  data['descriptionword'] = descriptionword;
  data['wordlevel'] = wordlevel;
  data['languageid'] = languageid;
  data['typeofword'] = typeofword;
  data['wordcounter'] = wordcounter;
  return data;
 }
}