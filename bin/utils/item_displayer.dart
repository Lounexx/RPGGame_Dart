import 'dart:io';

import '../items/weapons/weapon.dart';

class ItemDisplayer {
  static void displayAllWeapons(List<Weapon> weapons) {
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
    for (Weapon weapon in weapons) {
      String weaponLine = "";
      weaponLine += centerAword(columnTable[0], weapon.name!);
      weaponLine +=
          centerAword(columnTable[1], weapon.levelRequirement.toString());
      weaponLine += centerAword(columnTable[2], weapon.damage.toString());
      weaponLine +=
          centerAword(columnTable[3], weapon.critMultiplier.toString());
      print(weaponLine);
      String stopLine = "-" * weaponLine.length;
      print(stopLine);
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
