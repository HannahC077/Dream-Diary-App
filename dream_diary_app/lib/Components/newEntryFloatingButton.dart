import 'package:flutter/material.dart';

class newEntryFloatingButton extends StatefulWidget {
  final VoidCallback onPressed;

  const newEntryFloatingButton({super.key, required this.onPressed});

  @override
  State<newEntryFloatingButton> createState() => _newEntryFloatingButtonState();
}

class _newEntryFloatingButtonState extends State<newEntryFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: nullFn,
      foregroundColor: Colors.white,
      backgroundColor: Color.fromRGBO(159, 134, 192, 1),
      shape: CircleBorder(),
      child: Icon(Icons.add, color: Colors.white),
    );
  }

  void nullFn() {}
}
