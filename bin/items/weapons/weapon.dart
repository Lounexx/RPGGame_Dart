import '../item.dart';

abstract class Weapon extends Item {
  int _damage;
  double _critMultiplier;

  Weapon(this._damage, this._critMultiplier, int levelRequirement,
      {String name = ""})
      : super(name, levelRequirement);

  get damage => this._damage;

  set damage(value) => this._damage = value;

  get critMultiplier => this._critMultiplier;

  set critMultiplier(value) => this._critMultiplier = value;
}
