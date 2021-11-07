import 'dart:io';

class TutorialText {
  static void initGameText() {
    stdout.writeln("! Bienvenue dans RPGGame_Dart !");
    stdout.writeln(
        "Cette version de ce jeu ne permet que le combat contre une vague d'ennemis.");
    stdout.writeln(
        "Votre but sera de survivre et tuer tous les ennemis de la vague sans mourir,\n" +
            "si vous mourrez, la partie s'arrête, vous n'aurez qu'a recommencer.");
    sleep(const Duration(seconds: 2));
    stdout.writeln(
        "Votre personnage possède des statistiques propres à sa classe, un inventaire et \n" +
            "des utilitaires comme des armes et des potions.");
    stdout.writeln("Bonne chance :^).");
    sleep(const Duration(milliseconds: 500));
    stdout.writeln("");
    sleep(const Duration(milliseconds: 500));
    stdout.writeln("");
    sleep(const Duration(milliseconds: 500));
  }
}
