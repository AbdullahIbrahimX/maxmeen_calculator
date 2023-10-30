import 'package:maxmeen_calculator/tools/models/channel.dart';

class Amplifier {
  double maxPower;
  bool divided;
  List<Channel> channels;

  Amplifier()
      : maxPower = 0,
        divided = false,
        channels = [];

  //todo delete me
  Amplifier.tester(this.maxPower, this.divided, this.channels);

  Amplifier.volt(this.maxPower, this.divided, this.channels);
  Amplifier.ohm(this.maxPower, this.channels) : divided = true;
}
