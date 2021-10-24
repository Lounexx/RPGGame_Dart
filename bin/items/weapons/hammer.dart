import 'weapon.dart';

class Hammer extends Weapon {
  Hammer(int damage, double critMultiplier, int levelRequirement)
      : super(damage, critMultiplier, levelRequirement) {
    super.name = "Marteau";
  }
}
