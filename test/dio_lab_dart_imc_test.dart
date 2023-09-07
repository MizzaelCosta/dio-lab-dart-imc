import 'package:dio_lab_dart_imc/models/pessoa.dart';
import 'package:dio_lab_dart_imc/services/imc_services.dart';
import 'package:test/test.dart';

void main() {
  group('Calcular IMC', () {
    var valoresDeTeste = {
      {'nome': 'Magreza grave', 'peso': 40.8, 'altura': 1.60}: '15.9',
      {'nome': 'Magreza moderada', 'peso': 42, 'altura': 1.60}: '16.4',
      {'nome': 'Magreza leve', 'peso': 50, 'altura': 1.60}: '19.5',
      {'nome': 'Saudável', 'peso': 60, 'altura': 1.60}: '23.4',
      {'nome': 'Sobrepeso', 'peso': 70, 'altura': 1.60}: '27.3',
      {'nome': 'Obesidade I', 'peso': 80, 'altura': 1.60}: '31.2',
      {'nome': 'Obesidade II', 'peso': 90, 'altura': 1.60}: '35.2',
      {'nome': 'Obesidade III', 'peso': 100, 'altura': 1.60}: '39.1',
      {'nome': 'Excessão: altura = 0', 'peso': 120, 'altura': 0}: '1200000.0',
      {'nome': 'Excessão: altura em centímetros', 'peso': 120, 'altura': 180}:
          '37.0',
    };

    valoresDeTeste.forEach((values, expected) {
      test('Entrada: $values Esperado: $expected', () {
        Pessoa pessoa = Pessoa(
          nome: values['nome'].toString(),
          peso: double.parse(values['peso'].toString()),
          altura: double.parse(values['altura'].toString()),
        );

        IMCService teste = IMCService()..calcularIMC(pessoa);
        expect(teste.imc, expected);
      });
    });
  });
}
