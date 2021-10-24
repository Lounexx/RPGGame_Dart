import 'dart:io';

import '../entite.dart';
import '../joueur.dart';

class CombatSystem {
  Joueur _player;
  Entite _opponent;

  CombatSystem(this._player, this._opponent) {
    print("Fight between " +
        _player.name +
        " and " +
        _opponent.name +
        " has started");
  }

  Joueur get player => this._player;

  set player(Joueur value) => this._player = value;

  Entite get opponent => this._opponent;

  set opponent(Entite value) => this._opponent = value;

  void selectAction() {
    bool verif = false;
    do {
      print("Choose an action");
      String? input = stdin.readLineSync();
      if (input == "attack") {
        player.attack(opponent);
        verif = true;
      } else if (input == "?") {
        print("Commandes disponibles:\n" + "- attack");
      } else if (input == "inventaire") {
        print("Voici votre inventaire");
        _player.inventory.displayInventory();
      } else {
        print("Mauvaise action, taper ? pour connaître toutes les commandes");
      }
    } while (verif == false);
  }

  void fight() {
    while (_player.isAlive && _opponent.isAlive) {
      selectAction();
      _opponent.attack(_player);
    }
    print("fight done");
  }
}
