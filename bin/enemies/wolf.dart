import '../entities/entite.dart';
import '../items/weapons/fists.dart';
import '../utils/loot_table.dart';

class Wolf extends Entite {
  Wolf(int level) : super('', 0, 0, 0, 0) {
    super.name = "Wolf";
    super.level = level;
    super.maxHealth = 40 + super.level * 12;
    super.health = super.maxHealth;
    super.damage = 10 + 8 * super.level;
    super.weapon = Fists(super.damage);
    super.isAlive = true;
    super.lootTable = LootTable.Wolf();
  }
}
