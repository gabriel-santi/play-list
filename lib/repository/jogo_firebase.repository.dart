import 'package:play_list/model/jogo.dart';
import 'package:play_list/repository/jogo.repository.dart';

class JogoFirebaseRepository implements JogoRepository {
  JogoFirebaseRepository._();

  static final _instance = JogoFirebaseRepository._();

  static get instance => _instance;

  @override
  Future<void> addJogo(Jogo jogo) async {
    // TODO: implement addJogo
    throw UnimplementedError();
  }

  @override
  Future<List<Jogo>> getJogos() async {
    // TODO: implement getJogos
    throw UnimplementedError();
  }

}