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
  Speaker.ohm(this.id, this.name, this.sku, this.watts, this.ohm)
      : chosenWatts = watts.first;
  Speaker.volt(this.id, this.name, this.sku, this.watts, this.ohm);

  setChosenWatts(double choice) {
    chosenWatts = choice;
  }
}
