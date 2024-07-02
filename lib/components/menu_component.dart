import 'package:flutter/material.dart';

class MenuComponent extends StatelessWidget {
  final Widget? child;
  final String text;
  final Function()? onTap;

  const MenuComponent({super.key, this.child, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 10,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.green, style: BorderStyle.solid),
          ),
          child: Column(
            children: [
              Expanded(
                child: child ?? const SizedBox(),
              ),
              Text(
                text,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
