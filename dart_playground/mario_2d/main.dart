import 'dart:math';

import 'personagem.dart';

void main() {
  Personagem personagem = Personagem();
  int numPersonagem = 0;
  String nomePersonagem;
  for (int i = 0; i <= 3;) {
    numPersonagem = Random().nextInt(4) + 1;
    if (numPersonagem == 1) {
      nomePersonagem = personagem.personagem1;
      print('O player ${i + 1} está com o persaonagem $nomePersonagem');
    }
    if (numPersonagem == 2) {
      nomePersonagem = personagem.personagem2;
      print('O player ${i + 1} está com o persaonagem $nomePersonagem');
    }
    if (numPersonagem == 3) {
      nomePersonagem = personagem.personagem3;
      print('O player ${i + 1} está com o persaonagem $nomePersonagem');
    }
    if (numPersonagem == 4) {
      nomePersonagem = personagem.personagem4;
      print('O player ${i + 1} está com o persaonagem $nomePersonagem');
    }
    i++;
  }
}
