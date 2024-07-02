import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  final Function()? onTap;
  final List<Widget>? children;

  const MyDialog({
    super.key,
    this.onTap,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ...children ?? [],
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade800,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child:  const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white,fontSize: 22),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30,)
        ],
      ),
    );
  }
}
