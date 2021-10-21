abstract class Item {
  String _name;
  int _levelRequirement;

  Item(this._name, this._levelRequirement);

  String get getName => this._name;

  set setName(String name) => this._name = name;

  int get levelRequirement => this._levelRequirement;

  set levelRequirement(int value) => this._levelRequirement = value;
}
