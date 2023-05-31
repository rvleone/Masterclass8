import 'dart:io';

final regexInt = RegExp(r'^\d+$');
main() {
  int posicao = 0;
  String? input = '';
  String retorno = '';

  while (retorno != 'validado') {
    print(
        'Digite até qual posição da sequência Fibonacci que você deseja visualizar:');
    input = stdin.readLineSync();
    retorno = validarPosicao(input);
    if (retorno == 'validado') {
      posicao = int.parse(input!);
      final (lista, valor) = implementarFibonacci(posicao);
      print(lista);
      print('O valor na posição $posicao = $valor');
    } else {
      print(retorno);
    }
  }
}

(List<int>, int) implementarFibonacci(int posicao) {
  List<int> lista = [0, 1];
  int valor = 0;
  if (posicao == 0) {
    lista.clear();
    return (lista, valor);
  } else if (posicao == 1) {
    lista.remove(1);
    return (lista, valor);
  } else if (posicao == 2) {
    valor = 1;
    return (lista, valor);
  } else {
    for (int i = 1; i <= posicao - 2;) {
      lista.add(lista[i - 1] + lista[i]);
      valor = lista[i + 1];
      i++;
    }
  }
  return (lista, valor);
}

String validarPosicao(String? input) {
  if (input == '') {
    return 'O campo não pode ser nulo, por favor';
  } else if (!regexInt.hasMatch(input!)) {
    return 'Só é permitido digitar número inteiro';
  } else {
    return 'validado';
  }
}
