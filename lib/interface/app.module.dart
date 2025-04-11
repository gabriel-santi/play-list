import 'package:play_list/repository/jogo.repository.dart';
import 'package:play_list/repository/jogo_firebase.repository.dart';
import 'package:play_list/repository/jogo_memo.repository.dart';

class AppModule {
  // static JogoRepository get jogoRepository => JogoMemoryRepository.instance;
  static JogoRepository get jogoRepository => JogoFirebaseRepository.instance;

}
