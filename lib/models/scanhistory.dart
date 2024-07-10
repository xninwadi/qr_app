class History{
  String id  = "";
  String userId = "";
  String qrId = "";
  String scanDate = DateTime.now().toIso8601String();

  History(this.id, this.userId, this.qrId, this.scanDate);

  History.map(dynamic obj){
    id = obj['id'];
    userId = obj['user_id'];
    qrId = obj['qr_id'];
    scanDate = obj['scan_date'];
  }

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['user_id'] = userId;
    map['qr_id'] = qrId;
    map['scan_date'] = scanDate;
    return map;
  }
}