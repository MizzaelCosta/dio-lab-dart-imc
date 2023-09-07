import 'dart:math';

import '../models/pessoa.dart';

///Classe para calculos de [imc] de [pessoa].
class Service {
  String? imc;
  String? classificacao;
  double? result;
  Pessoa? pessoa;

  ///Construtor da classe [Service].
  Service();

  ///Retorna a classificação de [imc] baseada no valor recebido.
  ///
  ///Função interna. Chamada pela [calcularIMC].
  String _classificarPorIMC(double imc) {
    if (imc < 16) {
      return 'Magreza grave';
    } else if (imc < 17) {
      return 'Magreza moderada';
    } else if (imc < 18.5) {
      return 'Magreza leve';
    } else if (imc < 25) {
      return 'Saudável';
    } else if (imc < 30) {
      return 'Sobrepeso';
    } else if (imc < 35) {
      return 'Obesidade Grau I';
    } else if (imc < 40) {
      return 'Obesidade Grau II (severa)';
    } else {
      return 'Obesidade Grau III (mórbida)';
    }
  }

  ///Calcula o IMC, baseado no [pessoa.peso] e [pessoa.altura].
  ///```
  ///             peso
  ///     IMC = ________
  ///                  2
  ///            altura
  ///```
  /// **Uso:**
  ///```
  ///var imc = calcularIMC(pessoa);
  ///```
  ///
  void calcularIMC(Pessoa paramPessoa) {
    pessoa = paramPessoa;
    if (pessoa!.altura == 0) {
      pessoa!.altura = 0.01;
    }

    pessoa = _verificarSeAlturaEmCentimetros();
    result = (pessoa!.peso / pow(pessoa!.altura, 2));
    classificacao = _classificarPorIMC(result!);
    imc = result!.toStringAsFixed(1);
  }

  ///Verifica se [pessoa.altura] está em centímetro.
  ///
  ///Função interna. Chamada pela função [calcularIMC].
  Pessoa _verificarSeAlturaEmCentimetros() {
    if (!pessoa!.altura.toString().contains('.')) {
      pessoa!.altura = pessoa!.altura / 100;
    }
    return pessoa!;
  }

  /// Mostra o resultado obtido após a chamada da função [calcularIMC].
  ///
  /// Em caso de [imc] ainda ser nulo a função mostra uma menssagem
  /// de aviso.
  void mostrarIMC(Service service) {
    if (imc == null) {
      print('Sem IMC, tente chamar [cacularIMC] antes.');
      return;
    }
    print('''${pessoa.toString()}
IMC: $imc - $classificacao
    ''');
  }
}
