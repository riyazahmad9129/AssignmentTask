import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_task/components/mytext1.dart';
import 'package:login_task/components/mytext_data.dart';

class ShowDistrict extends StatelessWidget {
  const ShowDistrict({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(500, 65),
        child: AppBar(
          title: const Text(
            "District",
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
            Hero(
              tag: "logo",
              child: Padding(
                padding: EdgeInsets.only(right: 18.0),
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
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
        child: Column(
          children: [
           MyTextD(title: "State", data: "State 1"),
            MyTextD(title: "District", data: "District 1")
          ],
        ),
      ),
    );
  }
}
