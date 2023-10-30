class Channel {
  double? maxPower;
  List<double>? ohmRange;

  Channel()
      : maxPower = 0,
        ohmRange = [0, 0];

  //todo delete me
  Channel.tester(this.maxPower, this.ohmRange);

  Channel.ohm(this.maxPower, this.ohmRange);
  Channel.volt(this.maxPower);
}
