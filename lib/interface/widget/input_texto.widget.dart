import 'package:flutter/material.dart';
import 'package:play_list/interface/constants.dart';

class InputTextoWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const InputTextoWidget({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kRadiusM),
            borderSide: BorderSide(
              color: Colors.orangeAccent.withOpacity(.5),
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kRadiusM),
            borderSide: BorderSide(
              color: Colors.orangeAccent.withOpacity(.5),
            )),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kRadiusM),
            borderSide: BorderSide(
              color: Colors.orangeAccent.withOpacity(.5),
            )),
      ),
      controller: controller,
    );
  }
}
