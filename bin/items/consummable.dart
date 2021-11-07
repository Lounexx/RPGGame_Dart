import '../entities/entite.dart';
import 'item.dart';

class Consummable extends Item {
  Consummable(int levelRequirement) : super(levelRequirement);

  void consume(Entite entite) {}
}
