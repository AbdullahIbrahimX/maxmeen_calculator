import 'package:flutter/material.dart';

enum kPorts {
  rca,
  jack,
  miniJack,
  hdmi,
  optical,
  xlr,
  xlrPhantom,
  bluetooth,
  usb,
  sdCard,
}

InputDecoration myTextFormDecoration({
  String labelText = "",
}) {
  return InputDecoration(
    labelText: labelText,
    fillColor: Colors.white,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: const BorderSide(
        color: Colors.blue,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2.0,
      ),
    ),
  );
}
