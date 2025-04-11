class Jogo {
  final String nome;
  final String urlImagem;

  Jogo._(this.nome, this.urlImagem);

  factory Jogo.criar(String nome, String url){
    _validarNome(nome);
    _validarURL(url);
    return Jogo._(nome, url);
  }

  static void _validarNome(String nome){
    if(nome.trim().isEmpty){
      throw NomeInvalido();
    }
  }

  static void _validarURL(String url){
    if(url.trim().isEmpty){
      throw UrlInvalida();
    }
  }
}

class NomeInvalido implements Exception {
  @override
  String toString() => "Insira um nome válido";
}

class UrlInvalida implements Exception {
  @override
  String toString() => "Insira uma URL válida";
}