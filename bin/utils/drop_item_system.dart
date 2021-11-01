import 'dart:math';

import '../items/item.dart';
import '../items/player_bound_items/inventory.dart';
import 'loot_table.dart';

class DropItemSystem {
  static Inventory dropItemOnDeath(LootTable lootTable) {
    Inventory droppedItems = Inventory.onDeath();
    for (Item item in lootTable.items) {
      int indexOfItem = lootTable.items.indexOf(item);
      double dropRateItem = lootTable.dropRates.elementAt(indexOfItem);
      if (isDropped(dropRateItem)) {
        droppedItems.inventory.add(item);
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
