import 'validar_cpf.dart';
import 'dart:io';

void main() {
  bool stop = false;
  String cpf = '';

  while (!stop) {
    print('Digite um CPF:\n');
    cpf = stdin.readLineSync()!;
    ValidarCPF validarCPF = ValidarCPF(cpf: cpf);
    if (validarCPF.validaCPF(cpf)) {
      stop = true;
      print('CPF válido');
    } else {
      print('CPF inválido');
    }
  }
}
