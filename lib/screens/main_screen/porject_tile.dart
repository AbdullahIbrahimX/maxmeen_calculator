import 'package:flutter/material.dart';
import 'package:maxmeen_calculator/tools/models/device.dart';
import 'package:maxmeen_calculator/tools/models/group.dart';
import 'package:maxmeen_calculator/tools/models/project.dart';
import 'package:maxmeen_calculator/tools/models/zone.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(project.name),
      children: [
        Card(
          color: Colors.blue,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: project.groups.length,
            //itemCount: 0,
            itemBuilder: (context, index) {
              Group group = project.groups[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GroupTile(group: group),
              );
            },
          ),
        ),
      ],
    );
  }
}

class GroupTile extends StatelessWidget {
  const GroupTile({
    super.key,
    required this.group,
  });

  final Group group;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amberAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(group.name),
          GridView.count(
            padding: const EdgeInsets.all(8.0),
            shrinkWrap: true,
            crossAxisCount: 2,
            children: List.generate(
              group.zones!.length ?? 0,
              (index) {
                Zone zone = group.zones![index];
                return ZoneTile(zone: zone);
              },
            ),
          ),
          GridView.count(
            padding: const EdgeInsets.all(8.0),
            shrinkWrap: true,
            crossAxisCount: 2,
            children: List.generate(
              group.devices!.length ?? 0,
              (index) {
                Device device = group.devices![index];
                return DeviceTile(device: device);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DeviceTile extends StatelessWidget {
  const DeviceTile({
    super.key,
    required this.device,
  });

  final Device device;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepOrangeAccent,
      child: Text(device.name),
    );
  }
}

class ZoneTile extends StatelessWidget {
  const ZoneTile({
    super.key,
    required this.zone,
  });

  final Zone zone;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      child: Text(zone.name),
    );
  }
}
