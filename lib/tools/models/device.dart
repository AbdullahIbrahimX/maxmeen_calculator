import 'package:maxmeen_calculator/kports.dart';
import 'package:maxmeen_calculator/tools/models/amplifiers.dart';

class Device {
  String id;
  String name;
  String sku;
  List<kPorts> inputs;
  List<kPorts> outputs;
  double totalPower;
  List<Amplifier> amplifiers;
  String? zoneId;

  Device(this.name, this.id)
      : sku = "",
        inputs = [],
        outputs = [],
        totalPower = 0,
        amplifiers = [];

  //todo delete me
  Device.tester(this.id, this.name, this.sku, this.totalPower, this.zoneId,
      this.inputs, this.outputs, this.amplifiers);

  Device.mixerNoPower(this.id, this.name, this.sku, this.inputs, this.outputs)
      : totalPower = 0,
        amplifiers = [];
  Device.mixerOrAmpWithPower(this.id, this.name, this.sku, this.inputs,
      this.outputs, this.totalPower, this.amplifiers);
}
