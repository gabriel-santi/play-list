import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_list/interface/controller/add_jogo/add_jogo_state.dart';
import 'package:play_list/model/erro_model.dart';
import 'package:play_list/model/jogo.dart';
import 'package:play_list/repository/jogo_firebase.repository.dart';

class AddJogoController extends AutoDisposeNotifier<AddJogoState> {
  @override
  AddJogoState build() => AddJogoState();

  Future<void> adicionarJogo(String nome, String url) async {
    state = state.copyWith(loading: true, erro: null);

    try {
      var jogo = Jogo.criar(nome, url);

      final repo = ref.read(jogoRepositoryProvider);
      await repo.addJogo(jogo);

      state = AddJogoState();

      ref.invalidate(jogosListProvider);
    } on ErroModel catch (e) {
      state = state.copyWith(loading: false, erro: e.toString());
    } on ErroConexao catch (e) {
      state = state.copyWith(loading: false, erro: e.toString());
    } catch (e) {
      state = state.copyWith(loading: false, erro: "Ocorreu um erro inesperado!");
    }
  }
}

final addJogoControllerProvider = AutoDisposeNotifierProvider<AddJogoController, AddJogoState>(() {
  return AddJogoController();
});
