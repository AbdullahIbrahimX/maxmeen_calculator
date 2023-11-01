import 'package:flutter/material.dart';
import 'package:maxmeen_calculator/kports.dart';

class ZoneRow extends StatelessWidget {
  const ZoneRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
              width: 90,
              child:
                  FilledButton(onPressed: () {}, child: const Text("Zone 1"))),
          SizedBox(
            height: 120,
            width: MediaQuery.sizeOf(context).width - 106,
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
        ],
      ),
    );
  }
}
