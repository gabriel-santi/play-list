import 'package:flutter/material.dart';
import 'package:play_list/interface/widget/card_jogo.widget.dart';
import 'package:play_list/model/jogo.dart';

class ListaJogosWidget extends StatelessWidget {
  final List<Jogo> jogos;

  const ListaJogosWidget({super.key, required this.jogos});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: jogos.length,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      separatorBuilder: (__, _) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        var jogo = jogos[index];

        return CardJogoWidget(nome: jogo.nome, urlImagem: jogo.urlImagem);
      },
    );
  }
}
