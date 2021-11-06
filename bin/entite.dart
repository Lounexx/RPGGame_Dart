import 'dart:mirrors';

import 'items/weapons/weapon.dart';
import 'utils/equip_conditioner.dart';
import 'utils/loot_table.dart';
import 'utils/randomizer.dart';

abstract class Entite {
  String _name;
  int _health;
  int _maxHealth;
  int _damage;
  double _critChance = 0.75;
  Weapon? weapon;
  int _level;
  bool _isAlive;
  LootTable? lootTable;

  Entite(this._name, this._health, this._maxHealth, this._damage, this._level,
      [this._isAlive = true]);

  String get name => this._name;

  set name(String value) => this._name = value;

  get health => this._health;

  set health(value) => this._health = value;

  int get maxHealth => this._maxHealth;

  set maxHealth(int value) => this._maxHealth = value;

  get damage => this._damage;

  set damage(value) => this._damage = value;

  Weapon? get getWeapon => this.weapon;

  set setWeapon(Weapon? weapon) => this.weapon = weapon;

  int get level => this._level;

  set level(int value) => this._level = value;

  bool get isAlive => this._isAlive;

  set isAlive(bool value) => this._isAlive = value;

  get getLootTable => this.lootTable;

  set setLootTable(lootTable) => this.lootTable = lootTable;

  double get critChance => this._critChance;

  set critChance(value) => this._critChance = value;

  void attack(Entite entite) {
    int damageDone;
    if (Randomizer.isEventTriggered(entite._critChance)) {
      print("Coup critique!");
      double damage = (weapon!.damage * weapon!.critMultiplier);
      entite.health = entite.health - damage.round();
      damageDone = damage.round();
    } else {
      entite.health = entite.health - weapon!.damage;
      damageDone = weapon!.damage;
    }
    if (entite.health < 0) {
      entite.health = 0;
      entite._isAlive = false;
    }

    print(_name +
        " hits " +
        entite.name +
        " for " +
        damageDone.toString() +
        " with " +
        weapon!.name.toString() +
        " damage leaving him at " +
        entite.health.toString());
  }
}
