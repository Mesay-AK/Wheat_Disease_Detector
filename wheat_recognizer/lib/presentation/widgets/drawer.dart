import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      const DrawerHeader(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/logo.png')),
          ),
          child: Text(
            '',
          )),
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text('Home'),
        onTap: () {
          context.go("/home");
        },
      ),
      ListTile(
        leading: const Icon(Icons.question_answer),
        title: const Text('About'),
        onTap: () {
          context.go("/about");
        },
      ),
    ]));
  }
}
