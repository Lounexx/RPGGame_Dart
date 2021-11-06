import 'weapon.dart';

class Hammer extends Weapon {
  Hammer(int damage, double critMultiplier, int levelRequirement)
      : super(damage, critMultiplier, levelRequirement) {
    super.name = "Marteau";
  }
  Hammer.UniqueHammer() : super(80, 2.0, 1) {
    super.name = "Marteau De Jérémy";
  }
}
