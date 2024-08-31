import 'package:flutter/material.dart';
import 'package:gym_new_app/modules/clients/pages/clients_home.dart';
import 'package:gym_new_app/modules/clients/widgets/client_list_view.dart';
import 'package:gym_new_app/widgets/header_widget.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        const SizedBox(height: 18),
        ClientsHomePage()
        // const SizedBox(height: 18),
        // const ClientListView()
      ],
    );
  }
}
