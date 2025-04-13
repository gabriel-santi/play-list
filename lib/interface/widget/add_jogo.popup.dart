import 'package:flutter/material.dart';
import 'package:play_list/interface/app.module.dart';
import 'package:play_list/interface/controller/add_jogo.controller.dart';
import 'package:play_list/interface/widget/input_texto.widget.dart';

class AddJogoPopup extends StatefulWidget {
  const AddJogoPopup({super.key});

  @override
  State<AddJogoPopup> createState() => _AddJogoPopupState();
}

class _AddJogoPopupState extends State<AddJogoPopup> {
  final TextEditingController _jogoController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final AddJogoController _controller = AddJogoController(AppModule.jogoRepository);

  @override
  void dispose() {
    _jogoController.dispose();
    _urlController.dispose();
    super.dispose();
  }

  void _aoSalvar() async {
    try{
      await _controller.adicionarJogo(_jogoController.text, _urlController.text);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Jogo adicionado com sucesso!")));
      Navigator.of(context).pop();
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text("Adicionar jogo"),
      contentPadding: const EdgeInsets.symmetric(horizontal: Sizes.p20, vertical: Sizes.p20),
      children: [
        InputTextoWidget(
          label: "Jogo",
          controller: _jogoController,
        ),
        gapH12,
        InputTextoWidget(
          label: "Imagem URL",
          controller: _urlController,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.p12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p24, vertical: Sizes.p12),
          ),
          onPressed: _aoSalvar,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check),
              gapH8,
              Text("Salvar"),
            ],
          ),
        ),
      ],
    );
  }
}
