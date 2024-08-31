import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:gym_new_app/modules/clients/clients.dart';
import 'package:gym_new_app/modules/clients/pages/clients_perfil_page.dart';
import 'package:gym_new_app/modules/clients/pages/clients_register_page.dart';
import 'package:gym_new_app/modules/clients/repositories/client_repository.dart';
import 'package:gym_new_app/modules/home/pages/home_page.dart';

final GoRoute clientRoute = GoRoute(
  path: '/clients',
  name: 'clients',
  builder: (context, state) => const HomePage(),
  routes: [
    GoRoute(
      path: 'register',
      name: 'clientRegister',
      builder: (context, state) => const ClientsRegisterPage(),
    ),

    GoRoute(
      path: 'perfil/:id',
      name: 'clientsPerfil',
      builder: (context, state) {
        final String id = state.pathParameters['id']!;

        // Aqui, você pode buscar o cliente usando o ID antes de construir a página.

        return FutureBuilder<ClientsBasicInfo>(
          future: ClientRepository.fetchClientById(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Mostra um indicador de progresso enquanto a requisição está sendo feita.
            } else if (snapshot.hasError) {
              return const Center(
                  child: Text(
                      'Erro ao carregar dados do cliente')); // Lida com o erro caso ocorra
            } else if (snapshot.hasData) {
              return ClientsPerfilPage();

              // ClientsPerfilPage(
              //     client: snapshot
              //         .data!); // Passa o objeto ClientsBasicInfo para a página
            } else {
              return const Center(
                  child: Text(
                      'Cliente não encontrado')); // Lida com o caso de o cliente não ser encontrado
            }
          },
        );
      },
    )

    // GoRoute(
    //     path: 'perfil/:id',
    //     name: 'clientsPerfil',
    //     builder: (context, state) {
    //      String id = state.pathParameters['id']!;
    //       return ClientsPerfilPage(
    //         client: id,
    //       );
    //     }),
  ],
);
