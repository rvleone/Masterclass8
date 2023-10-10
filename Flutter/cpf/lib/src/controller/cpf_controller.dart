import 'package:flutter/material.dart';

class CpfController extends ChangeNotifier {
  var cpf = '';
  final regexCpf = RegExp(r'^\d{3}.\d{3}.\d{3}-\d{2}$');
  final regexFormat = RegExp(r'[^\d]');
  String cpfFormatado = '';
  String result = '';

  void setCpf(String value) {
    cpf = value;
  }

  void validaCPF(cpf) {
    if (!regexCpf.hasMatch(cpf)) {
      result = 'Cpf digitado incorretamente';
    } else {
      cpfFormatado = cpf.toString().replaceAll(regexFormat, '');
      if (validarDigito(cpfFormatado, 9) && (validarDigito(cpfFormatado, 10))) {
        result = 'CPF válido';
      } else {
        result = 'CPF inválido';
      }
    }
    notifyListeners();
  }

  bool validarDigito(String cpfFormatado, int numeroDigitos) {
    int digito = 0;
    int posicao = 2;
    double soma = 0.0;
    for (int i = numeroDigitos - 1; i >= 0;) {
      digito = int.parse(cpfFormatado[i]);
      soma += digito * posicao;
      i--;
      posicao++;
    }
    double resto = soma % 11;
    if (resto < 2 && int.parse(cpfFormatado[numeroDigitos]) == 0) {
      return true;
    } else if (resto >= 2 &&
        (int.parse(cpfFormatado[numeroDigitos]) == (11 - resto))) {
      return true;
    } else {
      return false;
    }
  }
}
