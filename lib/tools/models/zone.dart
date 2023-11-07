import 'package:maxmeen_calculator/tools/models/speaker.dart';

class Zone {
  String? name;
  double? width;
  double? length;
  double? area;
  double? levelOfSound;
  double? recommendedWatt;
  double? recommendedWattPerSpeaker;
  double? realWatt;
  double? speakerCount;
  List<Speaker>? speakers;

  Zone()
      : name = "",
        area = 0,
        levelOfSound = 0,
        speakers = [] {
    calculateRecommended();
  }
  //todo delete me
  Zone.tester(
      this.name,
      this.width,
      this.length,
      this.area,
      this.levelOfSound,
      this.recommendedWatt,
      this.recommendedWattPerSpeaker,
      this.realWatt,
      this.speakerCount,
      this.speakers);

  void calculateRecommended() {
    recommendedWatt = area! * levelOfSound! ?? 0;
    if (recommendedWatt != null && speakerCount != null) {
      recommendedWattPerSpeaker = recommendedWatt! / speakerCount!;
    }
  }
}
