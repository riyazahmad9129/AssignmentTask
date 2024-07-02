import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:login_task/add_child.dart';
import 'package:login_task/child_details.dart';
import 'package:login_task/components/child_component.dart';

class ChildScreen extends StatefulWidget {
  const ChildScreen({super.key});

  @override
  State<ChildScreen> createState() => _ChildScreenState();
}

class _ChildScreenState extends State<ChildScreen> {
  final childList = [
    {
      "title1": "Uttar Pradesh",
      "text": "Prakash Kumar",
      "page": const ChildDetails(),
      "child": const Icon(
        Icons.arrow_forward,
        size: 40,
        color: Colors.green,
      ),
    },
    {
      "title1": "Uttarakhand",
      "text": "Sanjay Singh",
      // "page": const ChildDetails(),
      "child": const Icon(
        Icons.arrow_forward,
        size: 40,
        color: Colors.green,
      ),
    },
    {
      "title1": "Bihar",
      "text": "Velu Saha",
      // "page": const ChildDetails(),
      "child": const Icon(
        Icons.arrow_forward,
        size: 40,
        color: Colors.green,
      ),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(500, 60),
        child: AppBar(
          title: const Text(
            "Children",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400),
          ),
          backgroundColor: Colors.green.shade800,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              CupertinoIcons.arrow_left,
              color: Colors.white,
              size: 30,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 18.0),
              child: Hero(
                  tag: "logo",
                  child: Icon(
                    CupertinoIcons.person_alt_circle,
                    color: Colors.white,
                    size: 50,
                  )),
            ),
          ],
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              final child = childList[index];
              return ChildComponent(
                text: child["title1"]?.toString() ?? '',
                text1: child["text"]?.toString() ?? "",
                child: child["child"] as Widget,
                onTap: () async {
                  context.loaderOverlay.show();

                  await Future.delayed(const Duration(seconds: 1));

                  context.loaderOverlay.hide();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChildDetails(),
                    ),
                  );
                },
              );
            },
            itemCount: 1,
          )),
      floatingActionButton: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(80),
        ),
        child: FloatingActionButton(
          onPressed: () async {

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddChild(),
              ),
            );
          },
          backgroundColor: Colors.green.shade800,
          elevation: 5,
          child: const Icon(
            CupertinoIcons.add,
            color: Colors.white,
            size: 30,
            weight: 25,
          ),
        ),
      ),
    );
  }
}
