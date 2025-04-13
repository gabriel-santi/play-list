import 'package:play_list/model/data.dart';
import 'package:play_list/model/erro_model.dart';

class Jogo {
  final String nome;
  final String urlImagem;
  final Data dataCriacao;

  Jogo._(this.nome, this.urlImagem, this.dataCriacao);

  factory Jogo.criar(String nome, String url) {
    _validarNome(nome);
    _validarURL(url);
    return Jogo._(nome, url, Data.agora());
  }

  static void _validarNome(String nome) {
    if (nome.trim().isEmpty) {
      throw NomeInvalido();
    }
  }

  static void _validarURL(String url) {
    if (url.trim().isEmpty) {
      throw UrlInvalida();
    }
  }

  factory Jogo.deMapa(Map<String, dynamic> mapa) {
    return Jogo._(mapa["nome"], mapa["url"], Data.deString(mapa["dataCriacao"]));
  }

  Map<String, dynamic> toMap() {
    return {
      "nome": nome,
      "url": urlImagem,
      "dataCriacao": dataCriacao.formatar(),
    };
  }
}

class NomeInvalido implements ErroModel {
  @override
  String toString() => "Insira um nome válido";
}

class UrlInvalida implements ErroModel {
  @override
  String toString() => "Insira uma URL válida";
}
