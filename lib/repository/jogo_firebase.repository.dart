import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:play_list/model/jogo.dart';
import 'package:play_list/repository/jogo.repository.dart';

class JogoFirebaseRepository implements JogoRepository {
  JogoFirebaseRepository._();

  static final _instance = JogoFirebaseRepository._();

  static get instance => _instance;

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
  String toString() => "Erro ao conectar!!";
}
