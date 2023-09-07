import 'dart:convert';
import 'dart:io';

/// Lê o terminal e retorna a [String] digitada.
///
/// Função de uso interno. Usada pelas Funções [lerTexto] e [lerDecimal].
String _lerTerminal({String? mensagem}) {
  print(mensagem);
  return stdin.readLineSync(encoding: utf8) ?? '';
}

/// Lê o terminal e retorna um valor do tipo [String].
///
/// **Uso:**
/// ```
/// terminal = lerString(mensagem: 'mensagem');
///
/// ```
String lerTexto({String? mensagem}) {
  try {
    return _lerTerminal(mensagem: mensagem);
  } on FormatException {
    print('Ops! Algo deu errado, vamos tentar de novo?');
    return lerTexto(mensagem: mensagem);
  } catch (e) {
    throw Exception(e);
  }
}

/// Lê o terminal e retorna um valor do tipo [double].
///
/// **Uso:**
/// ```
/// terminal = lerDecimal(mensagem: 'mensagem');
///
/// ```
double lerDecimal({String? mensagem}) {
  try {
    return double.parse(_lerTerminal(mensagem: mensagem));
  } on FormatException {
    print('Ops! Você digitou um número? Vamos tentar de novo...');
    return lerDecimal(mensagem: mensagem);
  } catch (e) {
    throw Exception(e);
  }
}
