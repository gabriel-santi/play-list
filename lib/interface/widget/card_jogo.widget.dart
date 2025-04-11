import 'package:flutter/material.dart';
import 'package:play_list/interface/constants.dart';

class CardJogoWidget extends StatelessWidget {
  final String nome;
  final String urlImagem;

  const CardJogoWidget({super.key, required this.nome, required this.urlImagem});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(kRadiusM), border: Border.all(color: Colors.grey)),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            width: 80,
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(kRadiusM - 2),
              child: Image.network(
                urlImagem,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              nome,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
