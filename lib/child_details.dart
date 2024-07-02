import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/deltails.dart';

class ChildDetails extends StatefulWidget {
  const ChildDetails({super.key});

  @override
  State<ChildDetails> createState() => _ChildDetailsState();
}

class _ChildDetailsState extends State<ChildDetails> {
  final detailList = [
    {"title": "Name", "text": "Prakash Kumar"},
    {"title": "Sex", "text": "Male"},
    {"title": "Date Of Birth", "text": "24/05/2004"},
    {"title": "Father's Name", "text": "Pushpesh Singh"},
    {"title": "Mother's Name", "text": "Kamla Singh"},
    {"title": "State", "text": "Uttar Pradesh"},
    {"title": "District", "text": "Chapra"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(500, 60),
        child: AppBar(
          title: const Text(
            "Child Details",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400),
          ),
          backgroundColor: Colors.green.shade800,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              CupertinoIcons.arrow_left,
              color: Colors.white,
              size: 25,
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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 530,
            width: 368,
            padding: const EdgeInsets.only(left: 20),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.green, width: 2),),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                      image: const DecorationImage(
                        image: AssetImage("lib/assets/child.jpg"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: detailList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 2.2),
                  itemBuilder: (context, index) {
                    final detail = detailList[index];
                    return DetailsComponent(
                      text: detail["title"].toString() ?? '',
                      text1: detail["text"].toString() ?? '',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
