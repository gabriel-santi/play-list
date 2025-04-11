import 'package:play_list/model/jogo.dart';

abstract class JogoRepository {
  Future<List<Jogo>> getJogos();

  Future<void> addJogo(Jogo jogo);
}