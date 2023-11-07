import 'package:flutter/material.dart';
import 'package:maxmeen_calculator/k_tester_data.dart';
import 'package:maxmeen_calculator/screens/add_project_screen/group_row.dart';
import 'package:maxmeen_calculator/screens/add_project_screen/title_splitter.dart';
import 'package:maxmeen_calculator/screens/add_project_screen/zone_row.dart';
import 'package:maxmeen_calculator/screens/main_screen/project_tile.dart';
import 'package:maxmeen_calculator/tools/models/group.dart';
import 'package:maxmeen_calculator/tools/models/project.dart';
import 'package:maxmeen_calculator/tools/models/speaker.dart';
import 'package:maxmeen_calculator/tools/models/zone.dart';

import '../../kPorts.dart';

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
  int? selectedZone;

  ///
  /// Group state control functions
  ///
  changeGroupPurpose(int index, String purpose) {
    setState(() {
      widget.newProject.groups![index].name = purpose;
    });
  }

  deleteGroup(int index) {
    setState(() {
      widget.newProject.groups!.removeAt(index);
      if (widget.newProject.groups!.isNotEmpty) {
        selectedGroup = 0;
      } else {
        selectedGroup = null;
      }
    });
  }

  setSelectedGroup(int index) {
    setState(() {
      selectedGroup = index;
    });
  }

  ///
  ///Zone state control functions
  ///
  updateZone(Zone newData, int index) {
    setState(() {
      widget.newProject.groups?[selectedGroup!].zones![index] = newData;
    });
  }

  deleteZone(int index) {
    setState(() {
      widget.newProject.groups![selectedGroup!].zones!.removeAt(index);
    });
  }

  setSelectedZone(int index) {
    setState(() {
      selectedZone = index;
    });
  }

  ///
  /// Speaker state control
  ///
  addSpeakers(List<Speaker> speakers) {
    setState(() {
      widget.newProject.groups?[selectedGroup!].zones?[selectedZone!].speakers!
          .addAll(speakers);
    });
  }

  deleteSpeaker(int index) {
    setState(() {
      widget.newProject.groups?[selectedGroup!].zones?[selectedZone!].speakers
          ?.removeAt(index);
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
              widget.newProject.groups!.length,
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
                      widget.newProject.groups!.add(Group("id", "name"));
                      selectedGroup = widget.newProject.groups!.length - 1;
                    });
                  },
                  child: const Text("Add Group")),

              ///
              /// Project Area Zones
              ///
              const TitleSplitter(
                  Icon(Icons.square_foot), "Area and level of sound"),
            ] +
            List.generate(
              selectedGroup == null
                  ? 0
                  : widget.newProject.groups?[selectedGroup!].zones?.length ??
                      0,
              (index) => ZoneRow(
                  index,
                  selectedZone == index,
                  setSelectedZone,
                  deleteZone,
                  widget.newProject.groups?[selectedGroup!].zones?[index] ??
                      Zone(),
                  updateZone),
            ) +
            [
              const SizedBox(height: 8.0),
              FilledButton(
                onPressed: () {
                  setState(() {
                    widget.newProject.groups?[selectedGroup!].zones
                        ?.add(Zone());
                    selectedZone = widget
                            .newProject.groups?[selectedGroup!].zones?.length ??
                        0 - 1;
                  });
                },
                child: const Text("Add Zone"),
              ),

              ///
              /// Project Speakers
              ///
              const TitleSplitter(Icon(Icons.speaker), "Speakers"),
              Container(
                height: 70,
                margin: const EdgeInsets.symmetric(horizontal: 8.9),
                child: ListView.builder(
                  // itemCount: widget.newProject.groups?[selectedGroup!]
                  //         .zones?[selectedZone!].speakers?.length ??
                  //     0,
                  itemCount: 4,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (index == 3) {
                      Speaker? chosenSpeaker = kSpeakersTester.first;
                      return SizedBox(
                        height: 70,
                        width: 70,
                        child: FilledButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => SimpleDialog(
                                title: const Text("Choose Speakers"),
                                children: [
                                  StatefulBuilder(
                                    builder: (BuildContext context,
                                        void Function(void Function())
                                            setState) {
                                      return DropdownButton<Speaker>(
                                        value: chosenSpeaker,
                                        onChanged: (speaker) {
                                          setState(() {
                                            chosenSpeaker = speaker;
                                          });
                                        },
                                        items: kSpeakersTester
                                            .map(
                                              (e) => DropdownMenuItem<Speaker>(
                                                value: e,
                                                child: Text(e.name),
                                              ),
                                            )
                                            .toList(),
                                      );
                                    },
                                  ),
                                  TextFormField(
                                    decoration: myTextFormDecoration(
                                        labelText: "Speaker count"),
                                  ),
                                  Row(
                                    children: [
                                      FilledButton(
                                        onPressed: () {
                                          //todo check form if pass => hook function to add speaker to the state
                                        },
                                        child: const Text("ADD"),
                                      ),
                                      FilledButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: FilledButton.styleFrom(
                                            backgroundColor: Colors.red),
                                        child: const Text("Cancel"),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.add,
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox(
                        height: 70,
                        width: 70,
                        child: Card(
                          color: Colors.blue,
                          child: Text("data"),
                        ),
                      );
                    }
                  },
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
