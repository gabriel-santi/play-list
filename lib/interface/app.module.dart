import 'package:play_list/repository/jogo.repository.dart';
import 'package:play_list/repository/jogo_memo.repository.dart';

class AppModule {
  static JogoRepository get jogoRepository => JogoMemoService.instance;
}
