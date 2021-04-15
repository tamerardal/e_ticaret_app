class Urun{
  int _id;
  String _name;
  String _description;
  double _price;

  Urun(this._name, this._description, this._price);
  Urun.withId(this._id, this._name, this._description, this._price);

  int get id => _id;
  set id(int value) {
    _id = value;
  }

  String get name => _name;
  set name(String value) {
    _name = value;
  }

  String get description => _description;
  set description(String value) {
    _description = value;
  }

  double get price => _price;
  set price(double value) {
    _price = value;
  }

  Map<String, dynamic> doMap(){
    //dynamic tüm veri tiplerini kapsar
    var map = Map<String, dynamic>();
    map["name"] = _name;
    map["description"] = _description;
    map["price"] = _price;

    if(_id != null){
      map["id"] = _id;
    }
    return map;
  }

  Urun.fromObject(dynamic o){
    this._id = o["id"];
    this._name = o["name"];
    this._description = o["description"];
    this._price = double.tryParse(o["price"].toString());
  }
}