abstract class Item {
  int _levelRequirement;

  Item(this._levelRequirement);

  int get levelRequirement => this._levelRequirement;

  set levelRequirement(int value) => this._levelRequirement = value;
}
