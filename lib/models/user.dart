class User {
  String? area;
  String? email;
  String? nameUser;
  String? password;
  String? zone;

  User({this.area, this.email, this.nameUser, this.password, this.zone});

  User.fromJson(Map<String, dynamic> json) {
    area = json['area'];
    email = json['email'];
    nameUser = json['nameUser'];
    password = json['password'];
    zone = json['zone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['area'] = area;
    data['email'] = email;
    data['nameUser'] = nameUser;
    data['password'] = password;
    data['zone'] = zone;
    return data;
  }
}
