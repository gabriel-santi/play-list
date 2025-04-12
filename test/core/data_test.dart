import 'package:flutter_test/flutter_test.dart';
import 'package:play_list/model/data.dart';

void main() {
  group("Data", () {
    test("Deve instanciar data corretamente", () {
      var data = Data.deString("11/04/2025");
      expect(data.formatar(), "11/04/2025");
    });

    test("Deve lançar exceção data inválida", () {
      try {
        Data.deString("String invalida");
        fail("Deveria retornar exceção");
      } catch (e) {
        expect(e.runtimeType, FormatoDataInvalido);
      }
    });
  });
}
