import 'dart:io';

void lerConfiguracoes(String nomeArquivo) {
  final file = File(nomeArquivo);

  if (!file.existsSync()) {
    print('Erro: Arquivo "$nomeArquivo" não encontrado.');
    return;
  }

  print("Configurações encontradas:");

  final linhas = file.readAsLinesSync();
  for (var linha in linhas) {
    if (linha.contains('=')) {
      var partes = linha.split('=');
      var chave = partes[0];
      var valor = partes[1];
      print("$chave: $valor");
    }
  }

  print('Arquivo "$nomeArquivo" lido e fechado.');
}

void main() {
  lerConfiguracoes("config.txt");
}
