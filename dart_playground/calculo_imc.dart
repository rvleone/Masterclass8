import 'dart:io';

final regexAltura = RegExp(r'\d.\d{2}$');
final regexPeso = RegExp(r'^(\d?\d?\d$)$');
main() {
  double altura = 0.0;
  ;
  double peso = 0.0;
  double imc = 0.0;
  String? input;
  String? erro = '';

  while (erro != 'validado') {
    print('Digite a sua altura:');
    input = stdin.readLineSync();
    erro = validarAltura(input);
    erro == 'validado' ? altura = double.parse(input!) : print('$erro');
  }
  erro = '';
  input = '';
  while (erro != 'validado') {
    print('Digite o seu peso:');
    input = stdin.readLineSync();
    erro = validarPeso(input);
    erro == 'validado' ? peso = double.parse(input!) : print('$erro');
  }
  imc = peso / (altura * altura);
  if (imc < 18.5) {
    print(
        'Seu IMC está em ${imc.toStringAsFixed(1)}, você está abaixo do peso.');
  } else if (imc >= 18.5 && imc <= 24.9) {
    print(
        'Seu IMC está em ${imc.toStringAsFixed(1)}, parabéns, você está com o peso ideal.');
  } else if (imc >= 25.0 && imc <= 29.9) {
    print(
        'Seu IMC está em ${imc.toStringAsFixed(1)}, você está levemente acima do peso.');
  } else if (imc >= 30.0 && imc <= 34.9) {
    print(
        'Seu IMC está em ${imc.toStringAsFixed(1)}, cuidado, você está com obesidade grau 1.');
  } else if (imc >= 35.0 && imc <= 39.9) {
    print(
        'Seu IMC está em ${imc.toStringAsFixed(1)}, cuidado, você está com obesidade grau 2.');
  } else {
    print(
        'Seu IMC está em ${imc.toStringAsFixed(1)}, cuidado, você está com obesidade grau 3.');
  }
}

String validarAltura(String? input) {
  if (input == '') {
    return 'O campo precisa ser preenchido, por favor digita uma altura';
  } else if (!regexAltura.hasMatch(input!)) {
    return 'O campo só pode conter números e ponto. Exemplo 1.78';
  } else {
    return 'validado';
  }
}

String validarPeso(String? input) {
  if (input == '') {
    return 'O campo precisa ser preenchido, por favor digita um peso';
  } else if (!regexPeso.hasMatch(input!)) {
    return 'O campo só pode conter números e o valor máximo é 999.';
  } else {
    return 'validado';
  }
}
