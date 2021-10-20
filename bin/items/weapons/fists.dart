import 'weapon.dart';

class Fists extends Weapon {
  Fists(int damage) : super(0, 0.0, 0) {
    super.name = 'fists';
    super.damage = damage;
    super.critMultiplier = 0.0;
    super.levelRequirement = 1;
  }
}
