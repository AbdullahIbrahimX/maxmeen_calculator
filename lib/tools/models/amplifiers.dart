import 'package:maxmeen_calculator/tools/models/channel.dart';

class Amplifier {
  double maxPower;
  bool divided;
  List<Channel>? channels;
  List<String> connectedZones;

  Amplifier()
      : maxPower = 0,
        divided = false,
        channels = [],
        connectedZones = [];

  //todo delete me
  Amplifier.tester(
      this.maxPower, this.divided, this.channels, this.connectedZones);

  Amplifier.volt(
      this.maxPower, this.divided, this.channels, this.connectedZones);
  Amplifier.ohm(this.maxPower, this.channels, this.connectedZones)
      : divided = true;
}
