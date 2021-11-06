import '../entite.dart';
import '../items/weapons/fists.dart';
import '../items/weapons/hammer.dart';
import '../utils/loot_table.dart';

class Skeleton extends Entite {
  Skeleton(int level) : super('', 0, 0, 0, 0) {
    super.name = "Squelette";
    super.level = level;
    super.maxHealth = 25 + super.level * 15;
    super.health = super.maxHealth;
    super.damage = 10 + 8 * super.level;
    super.weapon = Hammer(20, 1.75, level);
    super.isAlive = true;
    super.lootTable = LootTable.Wolf();
  }

  Skeleton.Jeremy(int level) : super('', 0, 0, 0, 0) {
    super.name = "Jeremy le décédé";
    super.level = level;
    super.maxHealth = 60 + super.level * 15;
    super.health = super.maxHealth;
    super.damage = 30 + 8 * super.level;
    super.weapon = Hammer(60, 1.75, level);
    super.isAlive = true;
    super.lootTable = LootTable.Skeleton();
  }
}
