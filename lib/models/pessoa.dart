///Classe armazenadora dos dados necessários, e dos valores após
///a chamada de [calcularIMC].
class Pessoa {
  String nome;
  double peso;
  double altura;
  String? imc;
  String? classificacao;

  /// Construtor da classe [Pessoa].
  Pessoa({
    required this.nome,
    required this.peso,
    required this.altura,
  });

  /// Sobrescrita do [toString] para refletir as características da
  /// classe [Pessoa].
  ///
  ///```
  /// String toString(){
  ///   Nome: $nome
  ///   Peso: $peso
  ///   Altura: $altura
  ///   IMC: $imc - $classificacao
  /// }
  ///```
  @override
  String toString() {
    return '''
Nome: $nome
Peso: ${peso.toStringAsFixed(2)}
Altura: ${altura.toStringAsFixed(2)}
IMC: $imc - $classificacao
''';
  }
}
