import 'package:play_list/service/jogo.service.dart';
import 'package:play_list/service/jogo_memo.service.dart';

class AppModule {
  static JogoRepository get jogoRepository => JogoMemoService.instance;
}
