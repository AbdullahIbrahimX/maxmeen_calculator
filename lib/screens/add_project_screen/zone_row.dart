import 'package:flutter/material.dart';
import 'package:maxmeen_calculator/kports.dart';

class ZoneRow extends StatelessWidget {
  const ZoneRow(
    this.index,
    this.selected,
    this.setSelected,
    this.deleteZone, {
    super.key,
  });
  final int index;
  final bool selected;
  final Function(int) setSelected;
  final Function(int) deleteZone;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FilledButton(
          onPressed: () {},
          onLongPress: () => setSelected(index),
          style: FilledButton.styleFrom(
              backgroundColor: selected ? Colors.green : Colors.purple),
          child: Text("Zone $index"),
        ),
        Flexible(
          // height: 120,
          // width: MediaQuery.sizeOf(context).width - 110,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: myTextFormDecoration(labelText: "Width"),
                        onChanged: (value) {},
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          decoration: myTextFormDecoration(labelText: "length"),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          decoration: myTextFormDecoration(labelText: "area"),
                          onChanged: (value) {},
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
                        //todo change the status for the lvl to 0.5
                      },
                      child: const Text("Background"),
                    ),
                    FilledButton(
                      onPressed: () {
                        //todo change the status for the lvl to 1
                      },
                      child: const Text("Normal sound"),
                    ),
                    FilledButton(
                      onPressed: () {
                        //todo change the status for the lvl to 2
                      },
                      child: const Text("High sound"),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          decoration: myTextFormDecoration(labelText: "area"),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        FilledButton(
            onPressed: () {},
            onLongPress: () => deleteZone(index),
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text("Delete")),
      ],
    );
  }
}
