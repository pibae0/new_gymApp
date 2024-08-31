import 'package:flutter/material.dart';
import 'package:gym_new_app/modules/clients/pages/clients_home.dart';
import 'package:gym_new_app/modules/clients/pages/clients_register_page.dart';
import 'package:gym_new_app/widgets/dashboard_widget.dart';
import 'package:gym_new_app/widgets/side_menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          const Expanded(
              flex: 2,
              child: SizedBox(
                child: SideMenuWidget(),
              )),
          const Expanded(
            flex: 7,
            child: ClientsRegisterPage(),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.green,
            ),
          ),
        ],
      )),
    );
  }
}
