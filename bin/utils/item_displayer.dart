import 'dart:io';

import '../items/consummables/potion.dart';
import '../items/item.dart';
import '../items/player_bound_items/inventory.dart';
import '../items/weapons/weapon.dart';
import 'item_sorter.dart';

class ItemDisplayer {
  static void displayInventory(Inventory inventory) {
    List<Weapon> weapons = ItemSort.getAllWeapons(inventory);
    List<Potion> potions = ItemSort.getAllPotions(inventory);
    if (weapons.isNotEmpty) {
      displayAllWeapons(weapons);
    }
    if (potions.isNotEmpty) {
      displayAllPotions(potions);
    }
  }

  static void displayAllWeapons(List<Weapon> weapons) {
    List<String> columnNames = [
      "Nom de l'arme",
      "Niveau requis",
      "Dégâts",
      "Crit multiplier"
    ];
    optimizedDisplay(columnNames, weapons);
  }

  static void displayAllPotions(List<Potion> potions) {
    List<String> columnNames = [
      "Nom de la potion",
      "Niveau requis",
      "Effet de la potion"
    ];
    optimizedDisplay(columnNames, potions);
  }

  static String optimizedCenterWord(int maxSize, String word) {
    String text_displayed = "";
    int marge = (maxSize - word.length) ~/ 2;
    List<String> display = List.filled(maxSize, " ");
    for (int i = 0; i < word.length; i++) {
      display[marge] = word[i];
      marge++;
    }
    for (String letter in display) {
      text_displayed += letter;
    }
    text_displayed += "|";
    return text_displayed;
  }

  static void optimizedDisplay(List<String> columnNames, List<Item> items) {
    int tableSize = 0;
    List<int> maxSizeColumnValues = List.empty(growable: true);
    List<List<String>> itemsInformations = List.empty(growable: true);
    for (Item item in items) {
      itemsInformations.add(gatherInfosFromAnItem(item));
    }
    int informationIndex = 0;
    for (String column in columnNames) {
      int maxSizeOfColumn = column.length;
      // Regarder pour chaque élément de la liste des listes d'informations
      for (List<String> information in itemsInformations) {
        // Si l'élément pour la colonne choisie est plus grand que le nom de la colonne
        if (information.elementAt(informationIndex).length > maxSizeOfColumn) {
          maxSizeOfColumn = information.elementAt(informationIndex).length;
        }
      }
      maxSizeColumnValues.add(maxSizeOfColumn);
      tableSize += maxSizeOfColumn + 1;
      informationIndex++;
    }
    String text_displayed = "";
    int index = 0;
    for (List<String> infosOfAnItem in itemsInformations) {
      text_displayed = "";
      if (itemsInformations.indexOf(infosOfAnItem) == 0) {
        displayColumnTags(columnNames, maxSizeColumnValues);
      }
      for (String anInfo in infosOfAnItem) {
        text_displayed +=
            optimizedCenterWord(maxSizeColumnValues[index], anInfo);
        index++;
      }
      print(text_displayed);
      index = 0;
    }
    if (itemsInformations.isNotEmpty) {
      print("-" * tableSize);
    }
  }

  static List<String> gatherInfosFromAnItem(Item item) {
    List<String> informations = List.empty(growable: true);
    if (item is Weapon) {
      informations.add(item.name!);
      informations.add(item.levelRequirement.toString());
      informations.add(item.damage.toString());
      informations.add(item.critMultiplier.toString());
    } else if (item is Potion) {
      informations.add(item.name!);
      informations.add(item.levelRequirement.toString());
      informations.add(item.description);
    }

    return informations;
  }

  static void displayColumnTags(List<String> columnTags, List<int> maxSize) {
    String columnLine = "";
    int i = 0;
    for (String columnName in columnTags) {
      columnLine += optimizedCenterWord(maxSize[i], columnName);
      i++;
    }
    print("-" * columnLine.length);
    print(columnLine);
    print("-" * columnLine.length);
  }
}
