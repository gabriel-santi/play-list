import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_list/model/jogo.dart';
import 'package:play_list/repository/jogo.repository.dart';

final jogoRepositoryProvider = Provider<JogoRepository>((ref) {
  return JogoFirebaseRepository();
});

final jogosListProvider = FutureProvider<List<Jogo>>((ref){
  final repo = ref.watch(jogoRepositoryProvider);
  return repo.getJogos();
});

class JogoFirebaseRepository implements JogoRepository {
  @override
  Future<void> addJogo(Jogo jogo) async {
    try {
      await FirebaseFirestore.instance.collection("games").add(jogo.toMap());
    } catch (e) {
      throw ErroConexao();
    }
  }

  @override
  Future<List<Jogo>> getJogos() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('games').get();

      List<Jogo> games = [];
      for (var doc in snapshot.docs) {
        games.add(Jogo.deMapa(doc.data()));
      }
      return games;
    } catch (e) {
      throw ErroConexao();
    }
  }
}

class ErroConexao implements Exception {
  @override
  String toString() => "Erro ao conectar!";
}
