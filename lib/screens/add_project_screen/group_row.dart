import 'package:flutter/material.dart';

import '../../kPorts.dart';

class GroupRow extends StatelessWidget {
  const GroupRow(
      this.onChange, this.delete, this.setSelected, this.index, this.selected,
      {super.key});

  final Function(int, String) onChange;
  final Function(int) delete;
  final Function(int) setSelected;
  final bool selected;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: FilledButton(
            style: FilledButton.styleFrom(
                backgroundColor: selected ? Colors.green : Colors.purple),
            onPressed: () {},
            onLongPress: () => setSelected(index),
            child: Text("Group$index"),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: TextFormField(
              decoration:
                  myTextFormDecoration(labelText: "Purpose of the group"),
              onChanged: (value) => onChange(index, value),
            ),
          ),
        ),
        FilledButton(
          style: FilledButton.styleFrom(backgroundColor: Colors.red),
          onLongPress: () => delete(index),
          onPressed: () {},
          child: const Text("Delete"),
        )
      ],
    );
  }
}
