import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:play_list/interface/route/app_routes.dart';
import 'package:play_list/interface/utils/constant.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(child: Text("Ops!!", style: TextStyle(fontSize: 24))),
          gapH8,
          const Text("Página não encontrada", style: TextStyle(fontSize: 16)),
          gapH32,
          FilledButton(
            onPressed: () {
              context.goNamed(AppRoutes.home.name);
            },
            child: const Text("Ir para home"),
          ),
        ],
      ),
    );
  }
}
