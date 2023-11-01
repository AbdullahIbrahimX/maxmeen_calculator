import 'package:flutter/cupertino.dart';
import 'package:maxmeen_calculator/tools/models/device.dart';
import 'package:maxmeen_calculator/tools/models/speaker.dart';

class ProductsProvider extends ChangeNotifier {
  /// I'll put all products from database here

  List<Speaker> speakers = [];
  List<Device> devices = [];
}
