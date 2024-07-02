import 'package:flutter/material.dart';

class ChildComponent extends StatelessWidget {
  final String text;
  final String text1;
  final Widget? child;
  final Function()? onTap;

  const ChildComponent(
      {super.key, required this.text, required this.text1, this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.only(left: 15,bottom: 5),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.green, width: 2)),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    text1,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.green.shade800,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.green.shade800,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Spacer(flex: 3,),
              Expanded(
                child: child ?? const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
