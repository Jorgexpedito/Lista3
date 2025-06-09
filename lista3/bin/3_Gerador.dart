import 'dart:io';

void adicionarItem(List<String> lista, String item) {
  lista.add(item);
}

void salvarListaEmArquivo(List<String> lista, String nomeArquivo) {
  final file = File(nomeArquivo);
  file.writeAsStringSync(lista.join('\n'));
  print('Lista de compras salva em "$nomeArquivo" com sucesso!');
}

void main() {
  List<String> listaCompras = [];

  while (true) {
    stdout.write("Digite um item da lista de compras (ou 'fim' para terminar): ");
    String item = stdin.readLineSync()!.trim();
    if (item.toLowerCase() == 'fim') break;
    adicionarItem(listaCompras, item);
  }

  salvarListaEmArquivo(listaCompras, "minhas_compras.txt");
}
