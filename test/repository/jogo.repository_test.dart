import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:play_list/model/jogo.dart';
import 'package:play_list/repository/jogo.repository.dart';

class JogoRepositoryMock extends Mock implements JogoRepository {}

void main() {
  group("Jogos Repository", () {
    test('Deve chamar addJogo com um objeto Jogo válido', () async {
      final repo = JogoRepositoryMock();
      final jogo = Jogo.criar('FIFA 25', "url");

      when(() => repo.addJogo(jogo)).thenAnswer((_) => Future.value());
      await repo.addJogo(jogo);
      verify(() => repo.addJogo(jogo)).called(1);
    });

    test("Deve chamar getJogos e retornar lista de jogos", () async {
      final repo = JogoRepositoryMock();
      var jogosFake = [
        Jogo.criar("Fifa", "_"),
        Jogo.criar("Forza", "_"),
      ];

      when(() => repo.getJogos()).thenAnswer((_) async => jogosFake);

      var jogos = await repo.getJogos();

      expect(jogos.length, 2);
    });
  });
}
