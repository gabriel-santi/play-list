import 'package:play_list/model/jogo.dart';
import 'package:play_list/repository/jogo.repository.dart';

class AddJogoController {
  final JogoRepository _repo;

  List<Jogo> jogos = [];

  AddJogoController(this._repo);

  Future<void> adicionarJogo(String nome, String url) async {
    var jogo = Jogo.criar(nome, url);
    await _repo.addJogo(jogo);
  }
}