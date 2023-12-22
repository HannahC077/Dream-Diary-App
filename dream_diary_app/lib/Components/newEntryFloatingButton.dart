import 'package:flutter/material.dart';

class NewEntryFloatingButton extends StatefulWidget {
  final VoidCallback onPressed;

  const NewEntryFloatingButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  State<NewEntryFloatingButton> createState() => _NewEntryFloatingButtonState();
}

class _NewEntryFloatingButtonState extends State<NewEntryFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: widget.onPressed,
      foregroundColor: Colors.white,
      backgroundColor: const Color.fromRGBO(159, 134, 192, 1),
      shape: const CircleBorder(),
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
