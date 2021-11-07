import '../entities/entite.dart';
import '../items/item.dart';

class EquipConditioner {
  static bool isLevelRequirementCorrect(Item item, Entite entite) {
    bool verif;
    entite.level >= item.levelRequirement ? verif = true : verif = false;
    return verif;
  }

  static bool canBeEquipped(Item item, Entite entite) {
    return false;
  }
}
