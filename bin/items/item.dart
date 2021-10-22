abstract class Item {
  String? name;
  int _levelRequirement;

  Item(this._levelRequirement, {this.name});

  String? get getName => this.name;

  set setName(String name) => this.name = name;

  int get levelRequirement => this._levelRequirement;

  set levelRequirement(int value) => this._levelRequirement = value;
}
