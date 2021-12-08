class UserApp {
  String? idUser;
  String? area;
  String? email;
  String? nameUser;
  String? password;
  String? zone;

  UserApp({this.area, this.email, this.nameUser, this.password, this.zone, this.idUser});

  UserApp.fromJson(Map<String, dynamic> json) {
    idUser = json["idUser"];
    area = json['area'];
    email = json['email'];
    nameUser = json['nameUser'];
    password = json['password'];
    zone = json['zone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["idUser"] = idUser;
    data['area'] = area;
    data['email'] = email;
    data['nameUser'] = nameUser;
    data['password'] = password;
    data['zone'] = zone;
    return data;
  }
}
