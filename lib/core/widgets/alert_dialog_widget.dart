import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  final String title;
  final String description;
  final List<Widget> actions;
  const AlertDialogWidget({
    required this.title,
    required this.description,
    required this.actions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF0B2342),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      title: Text(title),
      content: Text(
        description,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      actions: actions,
    );
  }
}
