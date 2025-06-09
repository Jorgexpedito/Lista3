import 'dart:io';

void adicionarTarefa(List<String> tarefas, String descricao) {
  tarefas.add(descricao);
}

void listarTarefas(List<String> tarefas) {
  var pendentes = tarefas.where((t) => !t.endsWith("(concluída)")).toList();
  var concluidas = tarefas.where((t) => t.endsWith("(concluída)")).toList();

  print("Tarefas pendentes:");
  if (pendentes.isEmpty) {
    print("Nenhuma tarefa pendente.");
  } else {
    for (var t in pendentes) {
      print("- $t");
    }
  }

  print("Tarefas concluídas:");
  if (concluidas.isEmpty) {
    print("Nenhuma tarefa concluida.");
  } else {
    for (var t in concluidas) {
      print("- $t");
    }
  }
}
void marcarConcluida(List<String> tarefas, int indice) {
  if (indice < 0 || indice >= tarefas.length) {
    print("Índice inválido.");
    return;
  }
  if (tarefas[indice].endsWith("(concluída)")) {
    print("Tarefa já está concluída.");
    return;
  }
  tarefas[indice] = "${tarefas[indice]} (concluída)";
  print("Tarefa \"${tarefas[indice]}\" concluída!");
}

void salvarTarefas(List<String> tarefas, String nomeArquivo) {
  final file = File(nomeArquivo);
  file.writeAsStringSync(tarefas.join('\n'));
  print('Tarefas salvas em "$nomeArquivo".');
}

void main() {
  List<String> tarefas = [];

  while (true) {
    print("\nEscolha uma opção:");
    print("1. Adicionar tarefa");
    print("2. Listar tarefas");
    print("3. Marcar tarefa como concluída");
    print("4. Sair");
    stdout.write("Opção: ");
    String? op = stdin.readLineSync();

    if (op == '1') {
      stdout.write("Digite a descrição da tarefa: ");
      String desc = stdin.readLineSync()!;
      adicionarTarefa(tarefas, desc);
    } else if (op == '2') {
      listarTarefas(tarefas);
    } else if (op == '3') {
      if (tarefas.isEmpty) {
        print("Nenhuma tarefa para concluir.");
        continue;
      }
      print("Qual tarefa deseja concluir");
      for (int i = 0; i < tarefas.length; i++) {
        print("[${i + 1}] ${tarefas[i]}");
      }
      stdout.write("Escolha: ");
      int escolha = int.parse(stdin.readLineSync()!) - 1;
      marcarConcluida(tarefas, escolha);
    } else if (op == '4') {
      salvarTarefas(tarefas, "tarefas.txt");
      print("Encerrando programa.");
      break;
    } else {
      print("Opção inválida.");
    }
  }
}
