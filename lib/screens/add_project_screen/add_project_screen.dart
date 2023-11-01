import 'package:flutter/material.dart';
import 'package:maxmeen_calculator/screens/add_project_screen/group_row.dart';
import 'package:maxmeen_calculator/screens/add_project_screen/title_splitter.dart';
import 'package:maxmeen_calculator/screens/main_screen/porject_tile.dart';
import 'package:maxmeen_calculator/tools/models/group.dart';
import 'package:maxmeen_calculator/tools/models/project.dart';

import '../../kports.dart';

class AddProjectScreen extends StatefulWidget {
  AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
  // final Project newProject = project2;
  final Project newProject = Project("");
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  String projectName = "";
  String customerName = "";
  String customerPhoneNumber = "";
  int? selectedGroup;

  changeGroupPurpose(int index, String purpose) {
    setState(() {
      widget.newProject.groups[index].name = purpose;
    });
  }

  deleteGroup(int index) {
    setState(() {
      widget.newProject.groups.removeAt(index);
    });
  }

  setSelectedGroup(int index) {
    setState(() {
      selectedGroup = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        children: [
              ///
              /// Project Name
              ///
              const TitleSplitter(Icon(Icons.abc_outlined), "Project Name"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        decoration:
                            myTextFormDecoration(labelText: "Project name"),
                        onChanged: (value) {
                          customerName = value;
                          setState(() {
                            widget.newProject.name =
                                "$customerName - $customerPhoneNumber";
                          });
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        decoration:
                            myTextFormDecoration(labelText: "Phone number"),
                        onChanged: (value) {
                          customerPhoneNumber = value;
                          setState(() {
                            widget.newProject.name =
                                "$customerName - $customerPhoneNumber";
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),

              ///
              /// Project Groups
              ///
              const TitleSplitter(Icon(Icons.speaker_group), "Groups"),
            ] +
            List.generate(
              widget.newProject.groups.length,
              (index) => GroupRow(changeGroupPurpose, deleteGroup,
                  setSelectedGroup, index, selectedGroup == index),
            ) +
            [
              const SizedBox(
                height: 8,
              ),
              FilledButton(
                  onPressed: () {
                    setState(() {
                      widget.newProject.groups.add(Group("id", "name"));
                    });
                  },
                  child: const Text("Add Group")),

              ///
              /// Project Area
              ///
              const TitleSplitter(
                  Icon(Icons.square_foot), "Area and level of sound"),
            ] +
            // List.generate(
            //     widget.newProject.groups[selectedGroup!].zones!.length,
            //     (index) => ZoneRow()) +
            [
              const SizedBox(height: 8.0),
              FilledButton(
                onPressed: () {},
                child: const Text("Add Zone"),
              ),

              ///
              /// Project Speakers
              ///
              const TitleSplitter(Icon(Icons.speaker), "Speakers"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FilledButton(onPressed: () {}, child: Text("Zone1")),
                    const SizedBox(height: 10),
                    FilledButton(onPressed: () {}, child: Text("Zone2")),
                    const SizedBox(height: 10),
                    FilledButton(onPressed: () {}, child: Text("Zone3")),
                    const SizedBox(height: 10),
                  ],
                ),
              ),

              ///
              /// Project Devices
              ///
              const TitleSplitter(
                  Icon(Icons.surround_sound_outlined), "Mixer/Amplifier"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FilledButton(onPressed: () {}, child: Text("Zone1")),
                    const SizedBox(height: 10),
                    FilledButton(onPressed: () {}, child: Text("Zone2")),
                    const SizedBox(height: 10),
                    FilledButton(onPressed: () {}, child: Text("Zone3")),
                    const SizedBox(height: 10),
                  ],
                ),
              ),

              ///
              /// Project Display
              ///
              const SizedBox(
                height: 100,
              ),
              ProjectTile(project: widget.newProject),
            ],
      ),
    );
  }
}
