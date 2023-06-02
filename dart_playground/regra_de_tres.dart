import 'dart:io';

List<double> numeros = [];
double icognita = 0.0;
String? input = '';
int posicao = 0;
double valor = 0.0;
String retorno = '';

main() {
  print('Vamos resolver uma regra de 3.\n' +
      'Para isso vamos digitar 4 valores sendo:\n' +
      '3 valores númericos e x para o valor que deseja descobrir.\n' +
      'a ordem dos valores é da seguinte maneira:\n' +
      'valor 1 _______ valor 2\n' +
      'valor 3 _______ valor 4\n');
  while (retorno != 'validado') {
    print('Digite o valor ${numeros.length + 1}');
    input = stdin.readLineSync();
    retorno = validarValores(input!);
    if (retorno == 'validado') {
      icognita = calcularValor();
      print('O valor da icógnita é: ${icognita.toStringAsFixed(2)}');
    } else {
      print(retorno);
    }
  }
}

String validarValores(String input) {
  final validarNumero = RegExp(r'[\d]+[.,]?[\d]+');
  final validarX = RegExp(r'[xX]');

  if (validarNumero.hasMatch(input)) {
    valor = double.parse(input);
    if (valor == 0.0) {
      return 'O valor não pode ser 0, favor digite outro valor.\n';
    }
    numeros.add(valor);
  } else if (validarX.hasMatch(input)) {
    if (numeros.contains(0.0)) {
      return 'Você já digitou uma icóginita, favor digitar algum valor numérico.\n';
    } else {
      numeros.add(0.0);
      posicao = numeros.length - 1;
    }
  } else {
    return 'Só pode digitar número ou x. Por favor digite o valor novamente.\n';
  }
  if (numeros.length == 4) {
    if (numeros.contains(0.0)) {
      return 'validado';
    } else {
      numeros.clear();
      return "Você não digitou nenhuma icógnita para o cálculo, favor digite todos os valores novamente.\n";
    }
  } else {
    return '';
  }
}

double calcularValor() {
  if (posicao == 0) {
    return (numeros[1] * numeros[2]) / numeros[3];
  } else if (posicao == 1) {
    return (numeros[0] * numeros[3]) / numeros[2];
  } else if (posicao == 2) {
    return (numeros[0] * numeros[3]) / numeros[1];
  } else {
    return (numeros[1] * numeros[2]) / numeros[0];
  }
}
