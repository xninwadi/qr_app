class Favorite{
  String id  = "";
  String userId = "";
  String qrId = "";

  Favorite(this.id, this.userId, this.qrId);

  Favorite.map(dynamic obj){
    id = obj['id'];
    userId = obj['user_id'];
    qrId = obj['qr_id'];
  }

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['user_id'] = userId;
    map['qr_id'] = qrId;
    return map;
  }
}