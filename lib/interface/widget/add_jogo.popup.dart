import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_list/interface/controller/add_jogo/add_jogo.controller.dart';
import 'package:play_list/interface/utils/constant.dart';
import 'package:play_list/interface/widget/input_texto.widget.dart';

class AddJogoPopup extends ConsumerStatefulWidget {
  const AddJogoPopup({super.key});

  @override
  ConsumerState<AddJogoPopup> createState() => _AddJogoPopupState();
}

class _AddJogoPopupState extends ConsumerState<AddJogoPopup> {
  final TextEditingController _jogoController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();

  @override
  void dispose() {
    _jogoController.dispose();
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(addJogoControllerProvider);
    final notifier = ref.read(addJogoControllerProvider.notifier);

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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.p12),
          child: controller.mensagemErro != null
              ? Text(
                  controller.mensagemErro!,
                  style: const TextStyle(color: Colors.redAccent),
                )
              : const SizedBox.shrink(),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.p12)),
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p24, vertical: Sizes.p12),
          ),
          onPressed: controller.loading
              ? null
              : () async {
                  await notifier.adicionarJogo(_jogoController.text, _urlController.text);
                  if (context.mounted) Navigator.pop(context);
                },
          child: controller.loading
              ? const SizedBox(
                  height: Sizes.p20,
                  width: Sizes.p20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Row(
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
