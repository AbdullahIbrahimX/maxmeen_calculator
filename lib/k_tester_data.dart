import 'package:maxmeen_calculator/tools/models/amplifiers.dart';
import 'package:maxmeen_calculator/tools/models/channel.dart';
import 'package:maxmeen_calculator/tools/models/device.dart';
import 'package:maxmeen_calculator/tools/models/group.dart';
import 'package:maxmeen_calculator/tools/models/project.dart';
import 'package:maxmeen_calculator/tools/models/speaker.dart';
import 'package:maxmeen_calculator/tools/models/zone.dart';

Project project1 = Project.tester(
  "0569491383",
  [
    Group.tester(
      "id1",
      "Alarm System",
      [
        Device.tester(
          "id11",
          "Maxmeen Amplifier 2400 watt",
          "MG-2400Zure",
          2400,
          [],
          [],
          [
            Amplifier.tester(
              240,
              false,
              [
                Channel.tester(240, []),
              ],
              [
                "livingRoom",
                "Men's Livingroom",
              ],
            ),
          ],
        ),
      ],
      [
        Zone.tester(
          "id21",
          "livingRoom",
          30,
          1,
          30,
          10,
          30,
          3,
          [
            Speaker.tester("sp1", "maxmeen", "SC156-6T", 10),
            Speaker.tester("sp2", "maxmeen", "SC156-6T", 10),
            Speaker.tester("sp3", "maxmeen", "SC156-6T", 10),
          ],
        ),
        Zone.tester(
          "id22",
          "Men's Livingroom",
          80,
          1,
          80,
          20,
          80,
          4,
          [
            Speaker.tester("sp1", "maxmeen", "MG-PR200", 20),
            Speaker.tester("sp2", "maxmeen", "MG-PR200", 20),
            Speaker.tester("sp3", "maxmeen", "MG-PR200", 20),
            Speaker.tester("sp4", "maxmeen", "MG-PR200", 20),
          ],
        ),
      ],
    ),
    Group.tester(
      "id1",
      "Hussainiah",
      [
        Device.tester(
          "id11",
          "Maxmeen Amplifier 2400 watt",
          "MG-2400Zure",
          2400,
          [],
          [],
          [
            Amplifier.tester(
              240,
              false,
              [
                Channel.tester(240, []),
              ],
              [
                "livingRoom",
                "Men's Livingroom",
              ],
            ),
          ],
        ),
      ],
      [
        Zone.tester(
          "id21",
          "livingRoom",
          30,
          1,
          30,
          10,
          30,
          3,
          [
            Speaker.tester("sp1", "maxmeen", "SC156-6T", 10),
            Speaker.tester("sp2", "maxmeen", "SC156-6T", 10),
            Speaker.tester("sp3", "maxmeen", "SC156-6T", 10),
          ],
        ),
        Zone.tester(
          "id22",
          "Men's Livingroom",
          80,
          1,
          80,
          20,
          80,
          4,
          [
            Speaker.tester("sp1", "maxmeen", "MG-PR200", 20),
            Speaker.tester("sp2", "maxmeen", "MG-PR200", 20),
            Speaker.tester("sp3", "maxmeen", "MG-PR200", 20),
            Speaker.tester("sp4", "maxmeen", "MG-PR200", 20),
          ],
        ),
      ],
    )
  ],
);

Project project2 = Project.tester(
  "Aseel Omran",
  [
    Group.tester(
      "id3",
      "House",
      [
        Device.tester(
          "1",
          "Maxmeen wall mount",
          "MG-R308",
          60,
          [],
          [],
          [
            Amplifier.tester(
              60,
              true,
              [
                Channel.tester(30, [4, 8]),
                Channel.tester(
                  30,
                  [4, 8],
                ),
              ],
              [
                "bedroom1",
              ],
            ),
          ],
        ),
        Device.tester(
          "2",
          "Maxmeen wall mount",
          "MG-R308",
          60,
          [],
          [],
          [
            Amplifier.tester(
              60,
              true,
              [
                Channel.tester(30, [4, 8]),
                Channel.tester(
                  30,
                  [4, 8],
                ),
              ],
              [
                "bedroom2",
              ],
            ),
          ],
        )
      ],
      [
        Zone.tester(
          "1",
          "bedroom1",
          20,
          0.5,
          20,
          10,
          20,
          2,
          [
            Speaker.tester("sp1", "maxmeen", "SC156-6T", 10),
            Speaker.tester("sp1", "maxmeen", "SC156-6T", 10),
          ],
        ),
        Zone.tester(
          "2",
          "bedroom2",
          20,
          0.5,
          20,
          10,
          20,
          2,
          [
            Speaker.tester("sp1", "maxmeen", "SC156-6T", 10),
            Speaker.tester("sp1", "maxmeen", "SC156-6T", 10),
          ],
        ),
      ],
    )
  ],
);
