import 'package:play_list/model/jogo.dart';
import 'package:play_list/repository/jogo.repository.dart';

class JogoMemoryRepository implements JogoRepository {
  JogoMemoryRepository._();

  static final _instance = JogoMemoryRepository._();

  static get instance => _instance;

  final List<Jogo> _jogos = [];

  @override
  Future<void> addJogo(Jogo jogo) async {
    _jogos.add(jogo);
  }

  @override
  Future<List<Jogo>> getJogos() async {
    await Future.delayed(const Duration(seconds: 2));
    return _jogos;
  }
}