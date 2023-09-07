import 'package:dio_lab_dart_imc/models/pessoa.dart';
import 'package:dio_lab_dart_imc/services/services.dart';
import 'package:dio_lab_dart_imc/utils/ler_console.dart';

void main() {
  Pessoa pessoa = Pessoa(
    nome: lerString(message: 'Digite seu nome: ').toUpperCase(),
    peso: lerDouble(message: 'Digite seu peso (Kg): '),
    altura: lerDouble(message: 'Digite sua altura (cm) - Apenas números: '),
  );
  Service imc = Service();
  imc
    ..calcularIMC(pessoa)
    ..mostrarIMC(imc);
}
