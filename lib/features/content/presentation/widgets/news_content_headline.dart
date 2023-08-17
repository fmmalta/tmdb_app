import 'package:flutter/material.dart';

class NewContentHeadline extends StatelessWidget {
  final void Function()? onTap;
  const NewContentHeadline(this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Novidades",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        InkWell(
            onTap: onTap, child: const Icon(Icons.search, color: Colors.white))
      ],
    );
  }
}
