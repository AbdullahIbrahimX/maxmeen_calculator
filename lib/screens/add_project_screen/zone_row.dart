import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maxmeen_calculator/kPorts.dart';
import 'package:maxmeen_calculator/tools/models/zone.dart';

class ZoneRow extends StatelessWidget {
  ZoneRow(
    this.index,
    this.selected,
    this.setSelected,
    this.deleteZone,
    this.zone,
    this.updateZone, {
    super.key,
  });
  final int index;
  final bool selected;
  final Function(int) setSelected;
  final Function(int) deleteZone;
  final Function(Zone, int) updateZone;
  final Zone zone;
  final TextEditingController widthController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController levelController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  calculateRecommended() {}

  @override
  Widget build(BuildContext context) {
    widthController.text = zone.width == null ? "" : "${zone.width}";
    lengthController.text = zone.length == null ? "" : "${zone.length}";
    areaController.text = zone.area == null ? "" : "${zone.area}";
    levelController.text =
        zone.levelOfSound == null ? "" : "${zone.levelOfSound}";
    return Row(
      children: [
        Column(
          children: [
            FilledButton(
              onPressed: () {},
              onLongPress: () => setSelected(index),
              style: FilledButton.styleFrom(
                  backgroundColor: selected ? Colors.green : Colors.purple),
              child: Text("Zone $index"),
            ),
            SizedBox(
                height: 40,
                child:
                    Center(child: Text("${zone.recommendedWatt ?? 0} watts"))),
          ],
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration:
                              myTextFormDecoration(labelText: "Zone Name"),
                          initialValue: zone.name,
                          onChanged: (value) {
                            zone.name = value;
                          },
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextFormField(
                            controller: widthController,
                            decoration:
                                myTextFormDecoration(labelText: "Width"),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (v) {
                              zone.width =
                                  double.parse(widthController.value.text);
                            },
                            validator: (value) {
                              return value == null || value.isEmpty
                                  ? "provide width"
                                  : null;
                            },
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextFormField(
                            controller: lengthController,
                            decoration:
                                myTextFormDecoration(labelText: "Length"),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (value) {
                              zone.length = double.parse(lengthController.text);
                            },
                            validator: (value) {
                              return value == null || value.isEmpty
                                  ? "provide length"
                                  : null;
                            },
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextFormField(
                            controller: areaController,
                            decoration: myTextFormDecoration(labelText: "Area"),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (value) {
                              zone.area = double.parse(value);
                            },
                            validator: (value) {
                              return value == null || value.isEmpty
                                  ? "provide area"
                                  : null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      FilledButton(
                        onPressed: () {
                          zone.levelOfSound = 0.5;
                          levelController.text = "0.5";
                        },
                        child: const Text("Background"),
                      ),
                      FilledButton(
                        onPressed: () {
                          zone.levelOfSound = 1;
                          levelController.text = "1";
                        },
                        child: const Text("Normal sound"),
                      ),
                      FilledButton(
                        onPressed: () {
                          zone.levelOfSound = 2;
                          levelController.text = "2";
                        },
                        child: const Text("High sound"),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextFormField(
                            controller: levelController,
                            decoration:
                                myTextFormDecoration(labelText: "Level ratio"),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (value) {
                              zone.levelOfSound = double.parse(value);
                            },
                            validator: (value) {
                              return value == null ||
                                      value.isEmpty ||
                                      double.parse(value) == 0.0
                                  ? "provide sound level"
                                  : null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Column(
          children: [
            FilledButton(
                onPressed: () {},
                onLongPress: () => deleteZone(index),
                style: FilledButton.styleFrom(backgroundColor: Colors.red),
                child: const Text("Delete")),
            const SizedBox(height: 20),
            FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (zone.area != 0.0) {
                      zone.width = zone.length = sqrt(zone.area!);
                    }
                    zone.area = zone.width! * zone.length!;

                    zone.calculateRecommended();
                    updateZone(zone, index);
                  }
                },
                child: const Text("Save")),
          ],
        ),
      ],
    );
  }
}
