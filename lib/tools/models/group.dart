import 'package:maxmeen_calculator/tools/models/device.dart';
import 'package:maxmeen_calculator/tools/models/zone.dart';

class Group {
  String id;
  String name;
  List<Zone>? zones;
  List<Device>? devices;

  Group(this.id, this.name)
      : zones = [],
        devices = [];

  //todo delete me
  Group.tester(this.id, this.name, this.devices, this.zones);
}
