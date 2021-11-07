import '../entities/entite.dart';
import '../items/weapons/fists.dart';
import '../utils/loot_table.dart';

class Dog extends Entite {
  Dog(int level) : super('', 0, 0, 0, 0) {
    super.name = "Clébard";
    super.level = level;
    super.maxHealth = 25 + super.level * 10;
    super.health = super.maxHealth;
    super.damage = 10 + 5 * super.level;
    super.critChance = 1;
    super.weapon = Fists(super.damage);
    super.isAlive = true;
    super.lootTable = LootTable.Wolf();
  }
}
