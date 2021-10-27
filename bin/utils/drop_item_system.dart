import 'dart:math';

import '../items/item.dart';
import 'loot_table.dart';

class DropItemSystem {
  static List<Item> dropItemOnDeath(LootTable lootTable) {
    List<Item> droppedItems = List.empty(growable: true);
    for (Item item in lootTable.items) {
      int indexOfItem = lootTable.items.indexOf(item);
      double dropRateItem = lootTable.dropRates.elementAt(indexOfItem);
      if (isDropped(dropRateItem)) {
        droppedItems.add(item);
      }
    }
    return droppedItems;
  }

  static bool isDropped(double dropRate) {
    bool verif = false;
    Random random = Random();
    double randomized = random.nextDouble();
    if (randomized <= dropRate) {
      verif = true;
    }
    return verif;
  }
}
