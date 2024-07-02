import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:login_task/components/my_dialog.dart';
import 'package:login_task/components/state_component.dart';

class StateScreen extends StatefulWidget {
  const StateScreen({super.key});

  @override
  State<StateScreen> createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  final stateLis = [
    {
      "title": "STATE1",
      "child": const Icon(
        Icons.arrow_forward,
        size: 40,
        color: Colors.green,
      ),
    },
    {
      "title": "STATE2",
      "child": const Icon(
        Icons.arrow_forward,
        size: 40,
        color: Colors.green,
      ),
    },
    {
      "title": "STATE3",
      "child": const Icon(
        Icons.arrow_forward,
        size: 40,
        color: Colors.green,
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(500, 60),
        child: AppBar(
          title: const Text(
            "State",
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.w400),
          ),
          backgroundColor: Colors.green.shade800,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              CupertinoIcons.arrow_left,
              color: Colors.white,
              size: 28,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 18.0),
              child: Hero(
                tag: "logo",
                child: Icon(
                  CupertinoIcons.person_alt_circle,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            final state = stateLis[index];
            return StateComponent(
              text: state["title"]?.toString() ?? '',
              child: state["child"] as Widget,
            );
          },
          itemCount: 3,
          itemExtent: 60,
          shrinkWrap: true,
        ),
      ),
      floatingActionButton: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(50),
        ),
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder(),
                  insetPadding: EdgeInsets.all(10),

                  // title: Text("Add State"),
                  child: MyDialog(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter State Name",
                          hintStyle: TextStyle(
                              fontSize: 22,
                              color: Colors.grey,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                    onTap: () {},
                  ),
                );
              },
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
