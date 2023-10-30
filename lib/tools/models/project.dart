import 'package:maxmeen_calculator/tools/models/group.dart';

class Project {
  String name;
  List<Group> groups;

  Project(this.name) : groups = [];
  //todo delete me
  Project.tester(this.name, this.groups);
}
