import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:login_task/components/district_component.dart';
import 'package:login_task/components/my_dialog.dart';
import 'package:login_task/provider/state_provider.dart';
import 'package:login_task/show_district.dart';
import 'package:provider/provider.dart';

import 'components/my_dropdown.dart';
import 'model/district_model.dart';
import 'model/dropdown_model.dart';

class DistrictScreen extends StatefulWidget {
  const DistrictScreen({super.key});

  @override
  State<DistrictScreen> createState() => _DistrictScreenState();
}

class _DistrictScreenState extends State<DistrictScreen> {
  @override
  void initState() {

    super.initState();
  }
  final districtList = [
    {
      "title1": "DISTRICT 1",
      "text": "STATE 1",
      "page": const ShowDistrict(),
      "child": const Icon(
        Icons.arrow_forward,
        size: 40,
        color: Colors.green,
      ),
    },
    {
      "title1": "DISTRICT  2",
      "text": "STATE 2",
      "page": const ShowDistrict(),
      "child": const Icon(
        Icons.arrow_forward,
        size: 40,
        color: Colors.green,
      ),
    },
    {
      "title1": "DISTRICT 3",
      "text": "STATE 3",
      "page": const ShowDistrict(),
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
            Padding(
              padding: EdgeInsets.only(right: 18.0),
              child: Icon(
                CupertinoIcons.person_alt_circle,
                size: 50,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            final district = districtList[index];
            return DistrictComponent(
              text: district["text"]?.toString() ?? '',
              text1: district["title1"].toString() ?? '',
              child: district["child"] as Widget,
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShowDistrict(),
                  ),
                );
                String? result = await context
                    .read<StateProvider>()
                    .get("district");
                if (result == null) {
                  print(result);

                }
              },
            );
          },
          itemCount: 1,
          itemExtent: 60,
        ),
      ),
      floatingActionButton: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(50),
        ),
        child: FloatingActionButton(
          onPressed: () async {

            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  shape: const RoundedRectangleBorder(),
                  insetPadding: const EdgeInsets.all(10),
                  child: MyDialog(
                    children: [
                      DropdownSearch<DropdownModel2>(
                        asyncItems: (st) =>
                            MyDropdown().getApi("master/get-state"),
                        itemAsString: (DropdownModel2 u) => u.name ?? "",
                        onChanged: (DropdownModel2? data) => print(data),
                        dropdownDecoratorProps: const DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              hintText: "Select State Name",
                              hintStyle: TextStyle(
                                  fontSize: 22, color: Colors.black38)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter District Name",
                          hintStyle: TextStyle(
                              fontSize: 22,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey),
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
