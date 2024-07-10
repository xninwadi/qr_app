class MyQRCode{
  String id  = "";
  String content = "";
  String contentType = "";
  String generateDate = DateTime.now().toIso8601String();

  MyQRCode(this.id, this.content, this.contentType, this.generateDate);

  static MyQRCode empty = MyQRCode("","","",DateTime.now().toIso8601String());

  MyQRCode.map(dynamic obj){
    id = obj['id'];
    content = obj['content'];
    contentType = obj['content_type'];
    generateDate = obj['generate_date'];
  }

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['content'] = content;
    map['content_type'] = contentType;
    map['generate_date'] = generateDate;
    return map;
  }
}