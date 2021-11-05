import '../items/potion.dart';
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

  static List<Weapon> searchWeapon(String itemName, List<Weapon> weapons) {
    List<Weapon> allWeapons = List.empty(growable: true);
    for (Weapon weapon in weapons) {
      if (weapon.name!.toLowerCase() == itemName) {
        allWeapons.add(weapon);
      }
    }
    return allWeapons;
  }

  static List<Potion> searchPotion(String itemName, List<Potion> potions) {
    List<Potion> allPotions = List.empty(growable: true);
    for (Potion potion in potions) {
      if (potion.name!.toLowerCase() == itemName) {
        allPotions.add(potion);
      }
    }
    return allPotions;
  }
}
