import 'package:flutter/material.dart';
import 'package:maxmeen_calculator/k_tester_data.dart';
import 'package:maxmeen_calculator/screens/main_screen/porject_tile.dart';
import 'package:maxmeen_calculator/tools/models/project.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    //todo delete me
    List<Project> recentProjectList = [project1, project2];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Maxmeen"),
        leading: const Icon(Icons.ac_unit),
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
      body: ListView.builder(
        itemCount: recentProjectList.length,
        itemBuilder: (context, index) {
          Project p = recentProjectList[index];
          return ProjectTile(project: p);
        },
      ),
    );
  }
}
