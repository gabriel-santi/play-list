import 'package:intl/intl.dart';

class Data {
  final DateTime valor;

  Data(this.valor);

  factory Data.agora() {
    return Data(DateTime.now());
  }

  String formatar([formato = "dd/MM/yyyy"]) {
    var f = DateFormat(formato);
    return f.format(valor);
  }

  factory Data.deString(String val) {
    var f = DateFormat("dd/MM/yyyy");
    var data = f.tryParse(val, true);
    if (data == null) throw FormatoDataInvalido();
    return Data(data);
  }
}

class FormatoDataInvalido implements Exception {
  @override
  String toString() => "Formato de data inválido";
}
