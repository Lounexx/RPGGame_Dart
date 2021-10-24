import 'dart:io';

import '../items/item.dart';
import '../items/weapons/weapon.dart';

class ItemDisplayer {
  static void displayAllWeapons(List<Item> items) {
    List<String> columnTable = [
      "Nom de l'arme",
      "Niveau requis",
      "Dégâts",
      "Multiplicateur critique"
    ];
    String allColumns = "";
    for (String column in columnTable) {
      allColumns += column + "|";
    }
    print(allColumns);
    print("-" * allColumns.length);
    for (Item item in items) {
      String itemLine = "";
      if (item is Weapon) {
        itemLine += centerAword(columnTable[0], item.name!);
        itemLine +=
            centerAword(columnTable[1], item.levelRequirement.toString());
        itemLine += centerAword(columnTable[2], item.damage.toString());
        itemLine += centerAword(columnTable[3], item.critMultiplier.toString());
      }
      print(itemLine);
      print("-" * itemLine.length);
    }
  }

  static String centerAword(String columnName, String word) {
    int tableSpacing = columnName.length;
    if (tableSpacing % 2 == 1) {}
    int calculateMarge = (tableSpacing - word.length) ~/ 2;
    if (calculateMarge % 2 == 1) {
      calculateMarge += 1;
    }
    List<String> display = List.filled(tableSpacing, " ");
    for (int i = 0; i < word.length; i++) {
      display[calculateMarge] = word[i];
      calculateMarge++;
    }
    String text_displayed = "";
    for (String letter in display) {
      text_displayed += letter;
    }
    text_displayed += "|";
    return text_displayed;
  }
}
