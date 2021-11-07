import 'weapon.dart';

class FireableWeapon extends Weapon {
  double _hitChance;

  FireableWeapon(
      int damage, double critMultiplier, int levelRequirement, this._hitChance)
      : super(damage, critMultiplier, levelRequirement);

  double get getHitChance => this._hitChance;

  set setHitChance(double hitChance) => this._hitChance = hitChance;
}
