import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_list/interface/utils/constant.dart';
import 'package:play_list/interface/widget/card_jogo.widget.dart';
import 'package:play_list/repository/jogo_firebase.repository.dart';

class ListaJogosWidget extends ConsumerWidget {
  const ListaJogosWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jogosValue = ref.watch(jogosListProvider);

    return jogosValue.when(
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        data: (jogos) => ListView.separated(
              itemCount: jogos.length,
              padding: const EdgeInsets.symmetric(vertical: Sizes.p20, horizontal: Sizes.p8),
              separatorBuilder: (__, _) => const SizedBox(height: Sizes.p8),
              itemBuilder: (context, index) {
                var jogo = jogos[index];

                return CardJogoWidget(nome: jogo.nome, urlImagem: jogo.urlImagem);
              },
            ),
        error: (e, st) => Center(child: Text(e.toString())));
  }
}
