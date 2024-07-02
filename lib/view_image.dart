import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ViewImage extends StatelessWidget {
  final String imagePath;

  const ViewImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {

                  },
                  child: const Row(
                    children: [
                      Text(
                        "Upload",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.upload,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
        title: const Text(
          "Preview",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Image.file(
          File(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
