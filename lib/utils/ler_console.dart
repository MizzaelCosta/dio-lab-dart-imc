import 'dart:convert';
import 'dart:io';

/// Lê o console e retorna a [String] digitada.
///
/// Função de uso interno. Usada pelas Funções [lerString] e [lerDouble].
String _lerConsole({String? message}) {
  print(message);
  return stdin.readLineSync(encoding: utf8) ?? '';
}

/// Lê o console e retorna um valor do tipo [String].
///
/// **Uso:**
/// ```
/// input = lerString(message:'message');
///
/// ```
String lerString({String? message}) {
  try {
    return _lerConsole(message: message);
  } on FormatException {
    print('Ops! Algo deu errado, vamos tentar de novo?');
    return lerString(message: message);
  } catch (e) {
    throw Exception(e);
  }
}

/// Lê o console e retorna um valor do tipo [double].
///
/// **Uso:**
/// ```
/// input = lerDouble(message:'message');
///
/// ```
double lerDouble({String? message}) {
  try {
    return double.parse(_lerConsole(message: message));
  } on FormatException {
    print('Ops! Você digitou um número? Vamos tentar de novo...');
    return lerDouble(message: message);
  } catch (e) {
    throw Exception(e);
  }
}
