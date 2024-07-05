class User {
  int? id;
  String userName = "";
  String displayName = "";
  String password = "";
  String? email;
  String? phone;

  User(
      {this.id,
      required this.userName,
      required this.displayName,
      required this.password,
      this.email,
      this.phone});

  User.map(dynamic obj) {
    this.id = obj['id'];
    this.userName = obj['userName'];
    this.displayName = obj['displayName'];
    this.password = obj['password'];
    this.email = obj['email'];
    this.phone = obj['phone'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['userName'] = userName;
    map['displayName'] = displayName;
    map['password'] = password;
    map['email'] = email;
    map['phone'] = phone;
    return map;
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      userName: map['userName'],
      displayName: map['displayName'],
      password: map['password'],
      email: map['email'],
      phone: map['phone'],
    );
  }
}

