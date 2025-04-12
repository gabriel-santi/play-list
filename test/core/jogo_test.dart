import 'package:flutter_test/flutter_test.dart';
import 'package:play_list/model/jogo.dart';

void main() {
  group("Jogo", () {
    test("Deve instanciar Jogo corretamente", () {
      var jogo = Jogo.criar("Teste", "url");
      expect(jogo.nome, "Teste");
      expect(jogo.urlImagem, "url");
    });

    test("Deve lançar exceção nome inválido", () {
      try {
        Jogo.criar("", "url");
        fail("Deveria ter lançado exceção");
      } catch (e) {
        expect(e.runtimeType, NomeInvalido);
      }
    });

    test("Deve lançar exceção URL inválido", () {
      try {
        Jogo.criar("Teste", "");
        fail("Deveria ter lançado exceção");
      } catch (e) {
        expect(e.runtimeType, UrlInvalida);
      }
    });
  });
}
