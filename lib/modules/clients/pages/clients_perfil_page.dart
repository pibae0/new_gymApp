import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_new_app/utils/const_colors.dart';

class ClientsPerfilPage extends StatelessWidget {
  final String? id;

  const ClientsPerfilPage({super.key, this.id});

  //TODO : Criar pagina de perfil dos alunos ...
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.medium,
      appBar: AppBar(
        leading: IconButton(
          onPressed: context.pop,
          icon: const Icon(Icons.chevron_left),
        ),
      ),
    );
  }
}
