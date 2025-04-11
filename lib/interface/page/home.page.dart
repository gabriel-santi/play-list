import 'package:flutter/material.dart';
import 'package:play_list/interface/app.module.dart';
import 'package:play_list/interface/controller/home.controller.dart';
import 'package:play_list/interface/widget/add_jogo.popup.dart';
import 'package:play_list/interface/widget/lista_jogos.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(AppModule.jogoRepository);

  @override
  void initState() {
    super.initState();
    _controller.obterJogos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text("Lista de jogos"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListaJogosWidget(jogos: _controller.jogos),
          ),
        ],
      ),
      floatingActionButton: IconButton(
        style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.orangeAccent)),
        onPressed: _abrirPopupAdicionar,
        icon: const Icon(Icons.add),
      ),
    );
  }

  void _abrirPopupAdicionar() async {
    await showDialog(
        context: context,
        builder: (context) {
          return const AddJogoPopup();
        });

    _atualizarLista();
  }

  void _atualizarLista() async {
    try {
      await _controller.obterJogos();
      setState(() {});
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
