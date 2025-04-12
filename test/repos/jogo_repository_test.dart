import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:play_list/model/jogo.dart';
import 'package:play_list/repository/jogo.repository.dart';

import '../mock/jogo_repository_test.mocks.dart';

@GenerateMocks([JogoRepository])
void main(){
  group("Jogos Repository", (){
    late MockJogoRepository repo;

    setUp((){
      repo = MockJogoRepository();
    });

    test('Deve chamar addJogo com um objeto Jogo válido', () async {
      final jogo = Jogo.criar( 'FIFA 25',  "url");

      // Configura comportamento do mockito para metodo especificado
      when(repo.addJogo(jogo)).thenAnswer((_) async {});

      await repo.addJogo(jogo);

      verify(repo.addJogo(jogo)).called(1);
    });

    test("Deve chamar getJogos e retornar lista de jogos", () async {
      var jogosFake = [
        Jogo.criar("Fifa", "_"),
        Jogo.criar("Forza", "_"),
      ];

      when(repo.getJogos()).thenAnswer((_) async => jogosFake);

      var jogos = await repo.getJogos();

      expect(jogos.length, 2);
    });
  });
}