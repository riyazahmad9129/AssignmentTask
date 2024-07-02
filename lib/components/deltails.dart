import 'package:flutter/material.dart';

class DetailsComponent extends StatelessWidget {
  final String? text;
  final String? text1;

  const DetailsComponent({super.key, this.text, this.text1});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          text!,
          style: const TextStyle(fontSize: 19, color: Colors.black),
        ),

        Text(
          text1!,
          style: TextStyle(fontSize: 19, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
