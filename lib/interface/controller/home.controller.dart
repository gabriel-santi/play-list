import 'package:play_list/model/jogo.dart';
import 'package:play_list/repository/jogo.repository.dart';

class HomeController {
  final JogoRepository _repo;

  List<Jogo> jogos = [];

  HomeController(this._repo);

  Future<void> obterJogos() async {
     jogos = await _repo.getJogos();
  }
}