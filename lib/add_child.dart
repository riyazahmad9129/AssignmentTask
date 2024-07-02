import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_task/camera_screen.dart';
import 'package:login_task/components/drop_1.dart';
import 'package:login_task/components/my_dropdown.dart';
import 'package:login_task/components/my_text_field.dart';
import 'package:login_task/components/new_drop.dart';
import 'package:login_task/model/district_model.dart';

import 'model/dropdown_model.dart';

class AddChild extends StatefulWidget {
  const AddChild({super.key});

  @override
  State<AddChild> createState() => _AddChildState();
}

class _AddChildState extends State<AddChild> {
  DateTime? selectedDate;

  final GlobalKey<FormState> _formkey = GlobalKey();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2024, 5),
      firstDate: DateTime(2005),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  String? _validateDate(DateTime? value) {
    if (value == null) {
      return 'Please select a date';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(500, 65),
        child: AppBar(
          backgroundColor: Colors.green.shade800,
          leading: Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                CupertinoIcons.arrow_left,
                size: 28,
                color: Colors.white,
              ),
            ),
          ),
          title: const Text(
            "Children",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 25),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 28.0),
              child: Icon(
                CupertinoIcons.person_alt_circle,
                size: 50,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  readOnly: false,
                  hintText: "Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field is required";
                    }
                    return null;
                  },
                ),
                const Drop1(
                  hint: "Sex",
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                      height: 50,
                      width: 900,
                      padding: const EdgeInsets.only(top: 15, left: 10),
                      decoration: const BoxDecoration(
                        border: BorderDirectional(
                          bottom: BorderSide(color: Colors.grey, width: 2),
                        ),
                      ),
                      child: Text(
                        selectedDate == null
                            ? "Date Of Birth"
                            : "${selectedDate!.toLocal()}".split(' ')[0],
                        style: TextStyle(
                            color: selectedDate == null
                                ? Colors.grey
                                : Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                MyTextField(
                  readOnly: false,
                  hintText: "Father's Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field is required";
                    }
                    return null;
                  },
                ),
                MyTextField(
                  readOnly: false,
                  hintText: "Mother's Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field is required";
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30, top: 15),
                  child: DropdownSearch<DropdownModel2>(
                    asyncItems: (st) => MyDropdown().getApi("master/get-state"),
                    itemAsString: (DropdownModel2 u) => u.name ?? "",
                    onChanged: (DropdownModel2? data) => print(data),
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10, top: 5),
                        hintText: "State",
                        hintStyle: TextStyle(fontSize: 25, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30, top: 15),
                  child: DropdownSearch<DropdownModel>(
                    asyncItems: (st) =>
                        MyDropdown1().getApi("master/get-district"),
                    itemAsString: (DropdownModel u) => u.name ?? "",
                    onChanged: (DropdownModel? data) => print(data),
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10, top: 5),
                        hintText: "District",
                        hintStyle: TextStyle(fontSize: 25, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, right: 28),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const CameraScreen(),
                      //     ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Center(
                        child: Text(
                          "Take a photo/Upload",
                          style: TextStyle(color: Colors.green, fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, right: 28),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade800,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Center(
                        child: Text(
                          "SUBMIT",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
