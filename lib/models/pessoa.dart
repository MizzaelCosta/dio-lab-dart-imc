///Classe armazenadora dos valores de [peso] e de [altura].
class Pessoa {
  String nome;
  double peso;
  double altura;

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
  /// }
  ///```
  @override
  String toString() {
    return '''

Nome: $nome
Peso: ${peso.toStringAsFixed(2)}
Altura: ${altura.toStringAsFixed(2)}''';
  }
}
