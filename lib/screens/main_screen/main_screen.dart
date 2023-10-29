import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Maxmeen"),
        leading: const Icon(Icons.abc),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text("Maxmeen"),
            ),
            ListTile(
              title: const Text("Products"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Projects"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Calculator"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
