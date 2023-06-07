import 'dart:convert';
import 'dart:math';

main() {
  String texto = '';
  String key = '';
  String encode = '';
  String decode = '';

  texto = gerarRandomico(10);
  key = gerarRandomico(texto.length);
  encode = gerarEncode(key: key, texto: texto);
  decode = gerarDecode(key: key, encode: encode);
  print('Texto aleatório: $texto');
  print('Chave Key Randômica: $key');
  print('Texco criptografado: $encode');
  print('Texto descriptografado: $decode');
}

String gerarRandomico(int tamanhoKey) {
  List<int> listaCaracteres = [];
  while (listaCaracteres.length < tamanhoKey) {
    listaCaracteres.add(Random().nextInt(25) + 65);
  }
  return AsciiDecoder().convert(listaCaracteres);
}

String gerarEncode({required String key, required String texto}) {
  List<int> listaEncode = [];
  for (int i = 0; i < texto.length;) {
    listaEncode
        .add((((texto.codeUnitAt(i) + key.codeUnitAt(i)) % 26) + 65).toInt());
    i++;
  }
  return AsciiDecoder().convert(listaEncode);
}

String gerarDecode({required String key, required String encode}) {
  List<int> listaDecode = [];
  for (int i = 0; i < encode.length;) {
    listaDecode.add(
        (((encode.codeUnitAt(i) - key.codeUnitAt(i) + 26) % 26) + 65).toInt());
    i++;
  }
  return AsciiDecoder().convert(listaDecode);
}
