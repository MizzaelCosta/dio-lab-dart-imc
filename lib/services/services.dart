import 'dart:math';

import '../models/pessoa.dart';

///Classe de serviços para calculos dos dados armazenados na classe [Pessoa].
class Service {
  ///Construtor da classe [Service].
  Service();

  ///Função interna. Chamada pela [calcularIMC] para atribuir a classificação
  ///
  ///baseada no valor de [imc] recebido na chamada da função.
  ///
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
  Pessoa calcularIMC(Pessoa pessoa) {
    if (pessoa.altura == 0) {
      pessoa.altura = 0.01;
    }

    pessoa = _verificarSeAlturaEmCentimetros(pessoa);
    double imc = pessoa.peso / pow(pessoa.altura, 2);
    pessoa.imc = imc.toStringAsFixed(1);
    pessoa.classificacao = _classificarPorIMC(imc);
    return pessoa;
  }

  ///Função interna. Chamada pela função [calcularIMC].
  ///
  ///Verifica se [pessoa.altura] está em centímetro.
  Pessoa _verificarSeAlturaEmCentimetros(Pessoa pessoa) {
    if (!pessoa.altura.toString().contains('.')) {
      pessoa.altura = pessoa.altura / 100;
    }
    return pessoa;
  }

  /// Mostra o resultado obtido após a chamada da função [calcularIMC].
  ///
  /// Em caso de [pessoa.imc] ainda ser nulo a função mostra uma menssagem
  /// de aviso.
  void mostrarIMC(Pessoa pessoa) {
    if (pessoa.imc == null) {
      print('Sem IMC, tente chamar [cacularIMC] antes.');
    }
    print(pessoa.toString());
  }
}
