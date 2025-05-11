import 'package:flutter/material.dart';
import 'package:play_list/interface/widget/add_jogo.popup.dart';
import 'package:play_list/interface/widget/lista_jogos.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text("Lista de jogos"),
      ),
      body: const ListaJogosWidget(),
      floatingActionButton: IconButton(
        style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.orangeAccent)),
        onPressed: () => _abrirPopupAdicionar(context),
        icon: const Icon(Icons.add),
      ),
    );
  }

  void _abrirPopupAdicionar(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const AddJogoPopup();
        });
  }
}
