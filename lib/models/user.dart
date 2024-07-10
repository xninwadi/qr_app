class User {
  String id = "";
  String userName = "";
  String displayName = "";
  String password = "";
  String? email;
  String? phone;

  User(id,
      userName,
      displayName,
      password,
      email,
      phone);

  static User empty = User("","","","","","");

  User.map(dynamic obj) {
    if(obj != null){
      id = obj['id'];
      userName = obj['userName'];
      displayName = obj['displayName'];
      password = obj['password'];
      email = obj['email'];
      phone = obj['phone'];
    }
    else {
      User.empty;
    }
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
      map['id'],
      map['userName'],
      map['displayName'],
      map['password'],
      map['email'],
      map['phone'],
    );
  }
}

