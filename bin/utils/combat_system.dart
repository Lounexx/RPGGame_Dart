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

  get opponent => this._opponent;

  set opponent(value) => this._opponent = value;

  void selectAction() {
    print("Choose an action");
    bool verif = false;
    do {
      String? input = stdin.readLineSync();
      if (input == "attack") {
        player.attack(opponent);
        verif = true;
      } else if (input == "?") {
        print("Commandes disponibles:\n" + "- attack");
      } else {
        print("Mauvaise action, taper ? pour connaître toutes les commandes");
      }
    } while (verif == false);
  }
}
