import 'items/weapons/weapon.dart';
import 'utils/equip_conditioner.dart';

abstract class Entite {
  String _name;
  int _health;
  int _damage;
  Weapon? weapon;
  int _level;
  bool _isAlive;

  Entite(this._name, this._health, this._damage, this._level,
      [this._isAlive = true]);

  String get name => this._name;

  set name(String value) => this._name = value;

  get health => this._health;

  set health(value) => this._health = value;

  get damage => this._damage;

  set damage(value) => this._damage = value;

  Weapon? get getWeapon => this.weapon;

  set setWeapon(Weapon? weapon) => this.weapon = weapon;

  int get level => this._level;

  set level(int value) => this._level = value;

  bool get isAlive => this._isAlive;

  set isAlive(bool value) => this._isAlive = value;

  void attack(Entite entite) {
    entite.health = entite.health - weapon!.damage;
    if (entite.health < 0) {
      entite.health = 0;
      entite._isAlive = false;
    }

    print(_name +
        " hits " +
        entite.name +
        " for " +
        weapon!.damage.toString() +
        " with " +
        weapon!.name.toString() +
        " damage leaving him at " +
        entite.health.toString());
  }

  void equipWeapon(Weapon weapon) {
    EquipConditioner.isLevelRequirementCorrect(weapon, this) == true
        ? this.weapon = weapon
        : print("Niveau du joueur trop bas");
  }
}
