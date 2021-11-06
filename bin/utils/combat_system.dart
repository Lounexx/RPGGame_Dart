import 'dart:io';

import '../entite.dart';
import '../items/potion.dart';
import '../items/item.dart';
import '../items/player_bound_items/inventory.dart';
import '../items/weapons/weapon.dart';
import '../joueur.dart';
import 'drop_item_system.dart';
import 'item_displayer.dart';
import 'item_sorter.dart';

class CombatSystem {
  Joueur _player;
  Entite _opponent;
  bool _actionExecuted = false;

  CombatSystem(this._player, this._opponent) {
    print("Fight between " +
        _player.name +
        "(" +
        _player.level.toString() +
        ")" +
        " and " +
        _opponent.name +
        "(" +
        _opponent.level.toString() +
        ")" +
        " has started");
  }

  Joueur get player => this._player;

  set player(Joueur value) => this._player = value;

  Entite get opponent => this._opponent;

  set opponent(Entite value) => this._opponent = value;

  bool get actionExecuted => this._actionExecuted;

  set actionExecuted(bool value) => this._actionExecuted = value;

  void selectAction() {
    _actionExecuted = false;
    do {
      print("Choose an action");
      String? input = stdin.readLineSync()!.toLowerCase();
      if (input == "attack") {
        player.attack(opponent);
        _actionExecuted = true;
      } else if (input == "inventory") {
        selectInventoryAction();
      } else if (input == "?") {
        print("Commandes disponibles:\n" + "- attack");
      } else {
        print("Mauvaise action, taper ? pour connaître toutes les commandes");
      }
    } while (_actionExecuted == false);
  }

  void selectInventoryAction() {
    bool verif = false;
    ItemDisplayer.displayInventory(_player.inventory);
    do {
      print("Que voulez-vous faire");
      String? input = stdin.readLineSync();
      // Si utilisateur tape equip
      if (input!.contains("equip")) {
        print("Quel objet voulez-vous équiper");
        List<Weapon> allWeapons = ItemSort.getAllWeapons(_player.inventory);
        ItemDisplayer.displayAllWeapons(allWeapons);
        input = stdin.readLineSync()!.toLowerCase();
        List<Weapon> searchItem = ItemSort.searchWeapon(input, allWeapons);
        // Si la liste a trouvé un ou des objets
        if (searchItem.isNotEmpty) {
          print("Lequel voulez-vous choisir");
          ItemDisplayer.displayAllWeapons(searchItem);
          try {
            int? inputChoice = int.parse(stdin.readLineSync().toString()) - 1;
            _player.equipWeapon(searchItem[inputChoice]);
            verif = true;
          } catch (e) {
            print("Erreur dans le choix");
          }
        } else {
          print("Pas d'objet portant ce nom");
        }
      } else if (input == "consume") {
        print("Quelle potion voulez-vous boire?");
        List<Potion> allPotions = ItemSort.getAllPotions(_player.inventory);
        ItemDisplayer.displayAllPotions(allPotions);
        input = stdin.readLineSync()!.toLowerCase();
        if (allPotions.isNotEmpty) {
          print("Lequel voulez-vous choisir");
          List<Item> potionChosen = ItemSort.searchPotion(input, allPotions);
          ItemDisplayer.displayAllPotions(potionChosen as List<Potion>);
          try {
            int listSize = potionChosen.length;
            int? inputChoice = int.parse(stdin.readLineSync().toString()) - 1;
            potionChosen.elementAt(inputChoice).consume(_player);
            // Si la potion a été retirée donc bue
            if (potionChosen.length == listSize - 1) {
              verif = true;
              _actionExecuted = true;
            }
          } catch (e) {
            print("Erreur dans le choix");
          }
        } else {
          print("Pas d'objet portant ce nom");
        }
      } else if (input == "?") {
        print("Commandes disponibles:\n" "- equip");
      } else {
        print("Mauvaise action, taper ? pour connaître toutes les commandes");
      }
    } while (!verif);
  }

  void selectLootAction(Inventory droppedItems) {
    bool verif = false;
    do {
      print("Que voulez-vous faire?");
      String? input = stdin.readLineSync();
      if (input! == "takeall") {
        for (Item item in droppedItems.inventory) {
          _player.inventory.addItem(item);
        }
        verif = true;
      } else if (input == "take") {
        print("Quel item voulez-vous prendre?");
        try {
          int? inputChoice = int.parse(stdin.readLineSync().toString()) - 1;
          _player.inventory.addItem(droppedItems.inventory[inputChoice]);
          verif = true;
        } catch (e) {
          print("Erreur dans le choix");
        }
      } else if (input == "?") {
        print("Commandes disponibles:\n" + "- takeall\n" + "-take");
      } else {
        print("Mauvaise action, taper ? pour connaître toutes les commandes");
      }
    } while (!verif);
  }

  void fight() {
    while (_player.isAlive && _opponent.isAlive) {
      selectAction();
      if (_opponent.isAlive) {
        _opponent.attack(_player);
      }
    }
    if (!_opponent.isAlive) {
      Inventory droppedItems =
          DropItemSystem.dropItemOnDeath(_opponent.lootTable!);
      if (droppedItems.inventory.isNotEmpty) {
        print("Inventaire de " + _opponent.name);
        ItemDisplayer.displayInventory(droppedItems);
        selectLootAction(droppedItems);
      }
    }
  }
}
