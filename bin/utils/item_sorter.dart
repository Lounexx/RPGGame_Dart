import '../items/consummables/potion.dart';
import '../items/item.dart';
import '../items/player_bound_items/inventory.dart';
import '../items/weapons/weapon.dart';

class ItemSort {
  static List<Weapon> getAllWeapons(Inventory inventory) {
    List<Weapon> allWeapons = List.empty(growable: true);
    for (Item? item in inventory.inventory) {
      if (item is Weapon) {
        allWeapons.add(item);
      }
    }
    return allWeapons;
  }

  static List<Potion> getAllPotions(Inventory inventory) {
    List<Potion> allPotions = List.empty(growable: true);
    for (Item? item in inventory.inventory) {
      if (item is Potion) {
        allPotions.add(item);
      }
    }

    return allPotions;
  }
}
