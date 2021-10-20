import '../item.dart';

abstract class Weapon extends Item {
  String? name;
  int _damage;
  double _critMultiplier;

  Weapon(this._damage, this._critMultiplier, int levelRequirement, {this.name})
      : super(levelRequirement);

  String? get getName => this.name;

  set setName(String? name) => this.name = name;

  get damage => this._damage;

  set damage(value) => this._damage = value;

  get critMultiplier => this._critMultiplier;

  set critMultiplier(value) => this._critMultiplier = value;
}
