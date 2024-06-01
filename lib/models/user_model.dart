class User {
  int? userid;
  String? avatarpath;
  String? username;
  String? password;
  String? name;
  String? surname;
  DateTime? birthDate;
  bool? status;
  String? phone;
  String? eposta;
  DateTime? lastseen;
  String? userrole;
  int? learnword;
  int? knowword;
  int? learned;

  User({
    this.userid,
    this.avatarpath,
    this.username,
    this.password,
    this.name,
    this.surname,
    this.birthDate,
    this.status,
    this.phone,
    this.eposta,
    this.lastseen,
    this.userrole,
    this.learnword,
    this.knowword,
    this.learned,
  });

  // JSON'dan UserModel'e dönüştürme
  User.fromJson(Map<String, dynamic> json) {
    userid = json['userid']?.toInt();
    avatarpath = json['avatarpath']?.toString();
    username = json['username']?.toString();
    password = json['password']?.toString();
    name = json['name']?.toString();
    surname = json['surname']?.toString();
    birthDate = json['birthDate'] != null ? DateTime.parse(json['birthDate']) : null;
    status = json['status'] == null ? null : json['status'] == 1;
    phone = json['phone']?.toString();
    eposta = json['eposta']?.toString();
    lastseen = json['lastseen'] != null ? DateTime.parse(json['lastseen']) : null;
    userrole = json['userrole']?.toString();
    learnword = json['learnword']?.toInt();
    knowword = json['knowword']?.toInt();
    learned = json['learned']?.toInt();
  }

  // UserModel'den JSON'a dönüştürme
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userid'] = userid;
    data['avatarpath'] = avatarpath;
    data['username'] = username;
    data['password'] = password;
    data['name'] = name;
    data['surname'] = surname;
    data['birthDate'] = birthDate?.toIso8601String();
    data['status'] = status == null ? null : (status! ? 1 : 0);
    data['phone'] = phone;
    data['eposta'] = eposta;
    data['lastseen'] = lastseen?.toIso8601String();
    data['userrole'] = userrole;
    data['learnword'] = learnword;
    data['knowword'] = knowword;
    data['learned'] = learned;
    return data;
  }
}
