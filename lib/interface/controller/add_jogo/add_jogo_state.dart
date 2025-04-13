class AddJogoState {
  final bool loading;
  final String? mensagemErro;

  AddJogoState({this.loading = false, this.mensagemErro});

  AddJogoState copyWith({bool? loading, String? erro}) {
    return AddJogoState(
      loading: loading ?? this.loading,
      mensagemErro: erro ?? mensagemErro,
    );
  }
}
