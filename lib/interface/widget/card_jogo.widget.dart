import 'package:flutter/material.dart';
import 'package:play_list/interface/utils/constant.dart';

class CardJogoWidget extends StatelessWidget {
  final String nome;
  final String urlImagem;

  const CardJogoWidget({super.key, required this.nome, required this.urlImagem});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(Sizes.p12), border: Border.all(color: Colors.grey)),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: Sizes.p8, horizontal: Sizes.p8),
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            width: 80,
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(Sizes.p8),
              child: Image.network(
                urlImagem,
                height: 100,
                width: 80,
                errorBuilder: (context, _, __) => Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported, color: Colors.grey),
                ) ,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Sizes.p8),
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
