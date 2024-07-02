import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:login_task/view_image.dart';


class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeContollerfuture;
  @override
  void initState() {
    _controller = CameraController(
        const CameraDescription(
            name: "0",
            lensDirection: CameraLensDirection.back,
            sensorOrientation: 1),
        ResolutionPreset.veryHigh);
    _initializeContollerfuture = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: FutureBuilder(
          future: _initializeContollerfuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(_controller);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 900.0),
        child: Center(
          child: FloatingActionButton(

            backgroundColor: Colors.white,
            child: Icon(Icons.camera_alt,size: 30,color: Colors.black54,),
            onPressed: () async {
              try {
                final image = await _controller.takePicture();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewImage(
                      imagePath: image.path,
                    ),
                  ),
                );
              } catch (e) {}
            },
          ),
        ),
      ),
    );
  }
}
