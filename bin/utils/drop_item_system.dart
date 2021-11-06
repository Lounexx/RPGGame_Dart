import '../items/item.dart';
import '../items/player_bound_items/inventory.dart';
import 'loot_table.dart';
import 'randomizer.dart';

class DropItemSystem {
  static Inventory dropItemOnDeath(LootTable lootTable) {
    Inventory droppedItems = Inventory.onDeath();
    for (Item item in lootTable.items) {
      int indexOfItem = lootTable.items.indexOf(item);
      double dropRateItem = lootTable.dropRates.elementAt(indexOfItem);
      if (Randomizer.isEventTriggered(dropRateItem)) {
        droppedItems.inventory.add(item);
      }
    }
    return droppedItems;
  }
}
