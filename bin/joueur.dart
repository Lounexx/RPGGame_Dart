// ignore_for_file: unnecessary_this

import 'dart:math';

import 'classes/classe.dart';
import 'entite.dart';
import 'items/player_bound_items/inventory.dart';
import 'items/weapons/fists.dart';

class Joueur extends Entite {
  Classe _classe;
  double _xp;
  double _xpCap;
  Inventory? _inventory;

  Joueur.start(
    String name,
    this._classe, [
    int health = 100,
    int maxHealth = 100,
    int damage = 10,
    int level = 1,
    this._xp = 0,
    this._xpCap = 100.0,
  ]) : super(name, health, maxHealth, damage, level) {
    super.maxHealth = super.health + _classe.stamina;
    super.health = super.maxHealth;
    super.damage = damage + _classe.strength;
    super.weapon = Fists(super.damage);
    this._inventory = Inventory();
  }

  Classe get classe => this._classe;

  set classe(Classe value) => this._classe = value;

  double get xp => this._xp;

  set xp(double value) => this._xp = value;

  double get xpCap => this._xpCap;

  set xpCap(double value) => this._xpCap = value;

  Inventory get inventory => this._inventory!;

  set inventory(Inventory value) => this._inventory = value;

  @override
  void attack(Entite entite) {
    super.attack(entite);
    if (entite.isAlive == false) {
      giveEXP(entite);
    }
  }

  void giveEXP(Entite entite) {
    double xpToGive = (entite.level * 10) * 1.25;
    this._xp = this._xp + xpToGive;
    print("+" + xpToGive.toString() + "xp");
    if (this._xp >= this._xpCap) {
      levelUP();
    }
  }

  void levelUP() {
    print("Level up!!");
    level = level + 1;
    //update des stats après level up
    _classe.strength = _classe.strength + _classe.strengthByLevel;
    _classe.stamina = _classe.stamina + _classe.staminaByLevel;
    _classe.agility = _classe.agility + _classe.agilityByLevel;
    _classe.intelligence = _classe.intelligence + _classe.intelligenceByLevel;

    //Max hp après augmentation de niveau
    super.maxHealth += classe.staminaByLevel;
    super.health = super.maxHealth;

    //Remet à zero barre d'xp avec changement de xpCap
    _xp = _xp - _xpCap;
    _xpCap = _xpCap + level * 50;
    print("You are level " +
        level.toString() +
        " with " +
        xp.toString() +
        "xp/" +
        xpCap.toString() +
        "xp");
  }
}
