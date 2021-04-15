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
}