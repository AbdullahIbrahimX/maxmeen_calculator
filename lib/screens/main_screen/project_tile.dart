import 'package:flutter/material.dart';
import 'package:maxmeen_calculator/tools/models/amplifiers.dart';
import 'package:maxmeen_calculator/tools/models/channel.dart';
import 'package:maxmeen_calculator/tools/models/device.dart';
import 'package:maxmeen_calculator/tools/models/group.dart';
import 'package:maxmeen_calculator/tools/models/project.dart';
import 'package:maxmeen_calculator/tools/models/speaker.dart';
import 'package:maxmeen_calculator/tools/models/zone.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: Column(
        children: [
          Text(project.name),
          ListView.builder(
            physics: const PageScrollPhysics(),
            shrinkWrap: true,
            itemCount: project.groups!.length,
            //itemCount: 0,
            itemBuilder: (context, index) {
              Group group = project.groups![index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GroupTile(group: group),
              );
            },
          ),
        ],
      ),
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
            physics: const PageScrollPhysics(),
            padding: const EdgeInsets.all(8.0),
            shrinkWrap: true,
            crossAxisCount: 2,
            children: List.generate(
              group.zones?.length ?? 0,
              (index) {
                Zone zone = group.zones![index];
                return ZoneTile(zone: zone);
              },
            ),
          ),
          GridView.count(
            physics: const PageScrollPhysics(),
            padding: const EdgeInsets.all(8.0),
            shrinkWrap: true,
            crossAxisCount: 2,
            children: List.generate(
              group.devices?.length ?? 0,
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
      child: Column(
        children: [
          Text(device.sku),
          GridView.count(
            physics: const PageScrollPhysics(),
            padding: const EdgeInsets.all(8.0),
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 0.53,
            children: List.generate(
              device.amplifiers?.length ?? 0,
              (index) {
                Amplifier amplifier = device.amplifiers![index];
                return AmplifierTile(amplifier: amplifier);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AmplifierTile extends StatelessWidget {
  const AmplifierTile({
    super.key,
    required this.amplifier,
  });

  final Amplifier amplifier;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black12,
      child: Column(
        children: [
          Text(
            "${amplifier.maxPower} watts",
            style: const TextStyle(color: Colors.white),
          ),
          GridView.count(
            physics: const PageScrollPhysics(),
            padding: const EdgeInsets.all(8.0),
            shrinkWrap: true,
            crossAxisCount: 2,
            children: List<Widget>.generate(
              amplifier.channels!.length,
              (index) {
                Channel channel = amplifier.channels![index];
                return ChannelTile(channel: channel);
              },
            ),
          ),
          GridView.count(
            physics: const PageScrollPhysics(),
            padding: const EdgeInsets.all(8.0),
            shrinkWrap: true,
            crossAxisCount: 2,
            children: List.generate(
              amplifier.connectedZones.length,
              (index) {
                String zoneName = amplifier.connectedZones[index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        zoneName,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class ChannelTile extends StatelessWidget {
  const ChannelTile({
    super.key,
    required this.channel,
  });

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${channel.maxPower} watts"),
              Text(channel.ohmRange!.isEmpty ? "100V" : "${channel.ohmRange}"),
            ],
          ),
        ),
      ),
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
      child: Column(
        children: [
          Text(zone.name ?? ""),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Recommended Watts : ${zone.recommendedWatt ?? 0}"),
              Text("Real Watts : ${zone.realWatt ?? 0}"),
            ],
          ),
          GridView.count(
            physics: const PageScrollPhysics(),
            padding: const EdgeInsets.all(8.0),
            shrinkWrap: true,
            crossAxisCount: 3,
            children: List.generate(
              zone.speakers?.length ?? 0,
              (index) {
                Speaker speaker = zone.speakers![index];
                return SpeakerTile(speaker: speaker);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SpeakerTile extends StatelessWidget {
  const SpeakerTile({
    super.key,
    required this.speaker,
  });

  final Speaker speaker;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.black12,
        child: Column(
          children: [
            Text(speaker.sku, style: const TextStyle(color: Colors.white)),
            Text("${speaker.chosenWatts} watts",
                style: const TextStyle(color: Colors.white)),
            Text(speaker.ohm == null ? "100v" : "8ohm",
                style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
