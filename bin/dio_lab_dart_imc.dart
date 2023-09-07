import 'package:dio_lab_dart_imc/models/pessoa.dart';
import 'package:dio_lab_dart_imc/services/imc_services.dart';
import 'package:dio_lab_dart_imc/utils/ler_console.dart';

void main() {
  Pessoa pessoa = Pessoa(
    nome: lerTexto(mensagem: 'Digite seu nome: ').toUpperCase(),
    peso: lerDecimal(mensagem: 'Digite seu peso (Kg): '),
    altura: lerDecimal(mensagem: 'Digite sua altura: '),
  );
  IMCService imc = IMCService();
  imc
    ..calcularIMC(pessoa)
    ..mostrarIMC(imc);
}
