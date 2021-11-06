import 'dart:io';

import '../entite.dart';
import '../joueur.dart';
import '../utils/equip_conditioner.dart';
import 'consummable.dart';
import 'item.dart';

abstract class Potion extends Item implements Consummable {
  late String _description;

  Potion(int levelRequirement) : super(levelRequirement);

  String get description => this._description;

  set description(String value) => this._description = value;

  @override
  void consume(Entite entite) {
    if (entite is Joueur) {
      entite.inventory.removeItem(this);
    }
  }
}
