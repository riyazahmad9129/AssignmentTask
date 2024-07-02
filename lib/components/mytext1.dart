import 'package:flutter/material.dart';

class MyTextD extends StatelessWidget {
  final String title;
  final String data;

  const MyTextD({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: const TextStyle(fontSize: 23),
            ),
          ),
          const Text(
            ":",
            style: TextStyle(fontSize: 23),
          ),
          const SizedBox(
            width: 6,
          ),
          Expanded(
            flex: 3,
            child: Text(
              data,
              style: TextStyle(fontSize: 22, color: Colors.grey.shade600),
            ),
          ),
        ],
      ),
    );
  }
}
