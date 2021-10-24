import 'dart:io';

import '../entite.dart';
import '../items/item.dart';
import '../items/weapons/weapon.dart';
import '../joueur.dart';
import 'item_displayer.dart';

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
      String? input = stdin.readLineSync()!.toLowerCase();
      if (input == "attack") {
        player.attack(opponent);
        verif = true;
      } else if (input == "?") {
        print("Commandes disponibles:\n" + "- attack");
      } else if (input == "inventaire") {
        print("Voici votre inventaire");
        _player.inventory.displayInventory();
        selectInventoryAction();
        verif = true;
      } else {
        print("Mauvaise action, taper ? pour connaître toutes les commandes");
      }
    } while (verif == false);
  }

  void selectInventoryAction() {
    bool verif = false;
    do {
      print("Que voulez-vous faire");
      String? input = stdin.readLineSync();
      // Si utilisateur tape equip
      if (input!.contains("equip")) {
        print("Quel objet voulez-vous équiper");
        input = stdin.readLineSync()!.toLowerCase();
        List<Item> searchItem = player.inventory.searchItem(input);
        // Si la liste a trouvé un ou des objets
        if (searchItem.isNotEmpty) {
          // S'il n'existe qu'un objet
          if (searchItem.length == 1) {
            if (searchItem[0] is Weapon) {
              _player.equipWeapon(searchItem[0] as Weapon);
              verif = true;
            }
          } else {
            ItemDisplayer.displayAllWeapons(searchItem);
            print("Lequel voulez-vous choisir");

            // Choix de l'item suivant les différentes options
            try {
              int? inputChoice = int.parse(stdin.readLineSync().toString());
              _player.equipWeapon(searchItem[inputChoice] as Weapon);
              verif = true;
            } catch (e) {
              print("Erreur dans le choix");
            }
          }
        } else {
          print("Pas d'objet portant ce nom");
        }
      } else if (input == "?") {
        print("Commandes disponibles:\n" + "- equip");
      } else {
        print("Mauvaise action, taper ? pour connaître toutes les commandes");
      }
    } while (!verif);
  }

  void fight() {
    while (_player.isAlive && _opponent.isAlive) {
      selectAction();
      _opponent.attack(_player);
    }
    print("fight done");
  }
}
