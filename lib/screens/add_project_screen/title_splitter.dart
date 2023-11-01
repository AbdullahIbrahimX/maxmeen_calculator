import 'package:flutter/material.dart';

class TitleSplitter extends StatelessWidget {
  final Icon icon;
  final String title;

  const TitleSplitter(
    this.icon,
    this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(5),
        ),
        leading: icon,
        title: Text(title),
      ),
    );
  }
}
