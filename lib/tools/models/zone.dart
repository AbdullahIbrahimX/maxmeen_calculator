import 'package:maxmeen_calculator/tools/models/speaker.dart';

class Zone {
  String id;
  String name;
  double area;
  double levelOfSound;
  double? recommendedWatt;
  double? recommendedWattPerSpeaker;
  double? realWatt;
  double? speakerCount;
  List<Speaker>? speakers;

  Zone(this.id, this.name, this.area, this.levelOfSound) {
    calculateRecommended();
  }

  void calculateRecommended() {
    recommendedWatt = area * levelOfSound;
    if (recommendedWatt != null && speakerCount != null) {
      recommendedWattPerSpeaker = recommendedWatt! / speakerCount!;
    }
  }
}
