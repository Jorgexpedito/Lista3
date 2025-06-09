import 'dart:io';

double calcularMedia(double n1, double n2, double n3) {
  if (n1 < 0 || n1 > 10 || n2 < 0 || n2 > 10 || n3 < 0 || n3 > 10) {
    return -1;
  }
  return (n1 + n2 + n3) / 3;
}

void main() {
  stdout.write("Digite a primeira nota: ");
  double n1 = double.parse(stdin.readLineSync()!);

  stdout.write("Digite a segunda nota: ");
  double n2 = double.parse(stdin.readLineSync()!);

  stdout.write("Digite a terceira nota: ");
  double n3 = double.parse(stdin.readLineSync()!);

  double media = calcularMedia(n1, n2, n3);

  if (media == -1) {
    print("Erro: Nota inválida inserida. As notas devem estar entre 0 e 10.");
  } else {
    print("Média: ${media.toStringAsFixed(2)}");
  }
}
