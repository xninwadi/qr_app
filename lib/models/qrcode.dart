class QRCode{
  int? _qrID;
  String? _qrCode;
  String? _content;
  String? _contentType;
  String? _generateDate;
  String? _scanDate;

  QRCode(this._qrID, this._qrCode, this._content, this._contentType, this._generateDate, this._scanDate);

  QRCode.map(dynamic obj){
    this._qrID = obj['qrId'];
    this._qrCode = obj['qrCode'];
    this._content = obj['content'];
    this._contentType = obj['contentType'];
    this._generateDate = obj['generateDate'];
    this._scanDate = obj['scanDate'];
  }

  int? get qrID => _qrID;
  String? get qrCode => _qrCode;
  String? get content => _content;
  String? get contentType => _contentType;
  String? get generateDate => _generateDate;
  String? get scanDate => _scanDate;

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map['qrID'] = _qrID;
    map['qrCode'] = _qrCode;
    map['content'] = _content;
    map['contentType'] = _contentType;
    map['generateDate'] = _generateDate;
    map['scanDate'] = _scanDate;
    return map;
  }
}