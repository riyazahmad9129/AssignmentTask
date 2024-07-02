import 'package:flutter/material.dart';

class StateComponent extends StatelessWidget {
  final String text;
  final Widget? child;

  const StateComponent({super.key, required this.text, this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.only(left: 25),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 2),
            shape: BoxShape.rectangle),
        child: Row(
          children: [
            Text(
              text,
              style: const TextStyle(
                  fontSize: 22,
                  color: Colors.green,
                  fontWeight: FontWeight.w400),
            ),
           Spacer(flex: 3,),
            Expanded(child: child ?? const SizedBox())
          ],
        ),
      ),
    );
  }
}
