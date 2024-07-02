import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:login_task/home_screen.dart';
import 'package:login_task/provider/login_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: OrientationBuilder(builder: (context, orn) {
            if (orn == Orientation.landscape) {
              return Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      "lib/assets/login..png",
                      scale: 0.70,
                    ),
                  ),
                  Expanded(
                    child: formWidget(),
                  )
                ],
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    "lib/assets/login..png",
                    scale: 0.70,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  formWidget()
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget formWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 30.0, left: 30),
          child: TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            controller: _idController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "This field is required";
              }
              return null;
            },
            decoration: const InputDecoration(
                hintText: "Username",
                contentPadding: EdgeInsets.only(left: 10),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 25),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2)),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 10))),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30.0, left: 30),
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: _passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "This field is required";
              }
              return null;
            },
            decoration: const InputDecoration(
                hintText: "Password",
                contentPadding: EdgeInsets.only(left: 10),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 25),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2)),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 20))),
          ),
        ),
        const SizedBox(
          height: 70,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25),
          child: ElevatedButton(
            onPressed: () async {
              if (!_formKey.currentState!.validate()) {
                return;
              }
              context.loaderOverlay.show();

              String? result = await context.read<LoginProvider>().login(
                  _idController.text.trim(), _passwordController.text.trim());
              context.loaderOverlay.hide();
              if (result == null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );


                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 2),
                    shape: RoundedRectangleBorder(),
                    backgroundColor: Colors.blueAccent,
                    dismissDirection: DismissDirection.startToEnd,
                    content: Text(
                      "Login Successfully",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
              } else {
                print(result);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade800,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: Text(
                  "LOGIN",
                  style: TextStyle(color: Colors.white54, fontSize: 25),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
