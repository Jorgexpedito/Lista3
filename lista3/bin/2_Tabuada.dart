import 'dart:io';

void exibirTabuada(int num) {
  print("Tabuada do $num:");
  for (int i = 1; i <= 10; i++) {
    print("$num X $i = ${num * i}");
  }
}

void main() {
  stdout.write("Digite um numero para ver a tabuadA ");
  int num = int.parse(stdin.readLineSync()!);

  exibirTabuada(num);
}
