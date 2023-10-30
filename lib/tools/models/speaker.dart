class Speaker {
  String id;
  String name;
  String sku;
  List<double> watts;
  double? chosenWatts;
  double? ohm;

  Speaker()
      : id = "",
        name = "",
        sku = "",
        watts = [];

  //todo delete me
  Speaker.tester(this.id, this.name, this.sku, this.chosenWatts) : watts = [];

  Speaker.ohm(this.id, this.name, this.sku, this.watts, this.ohm)
      : chosenWatts = watts.first;
  Speaker.volt(this.id, this.name, this.sku, this.watts, this.ohm);

  setChosenWatts(double choice) {
    chosenWatts = choice;
  }
}
