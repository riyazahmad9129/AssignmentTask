import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? hintText;
  final BorderRadius? borderRadius;
  final Color? fillColor;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? inputType;
  final bool isObscure;
  final Widget? suffixWidget;
  final int? maxLines;
  final bool readOnly;
  final Function()? onTap;
  const MyTextField(
      {super.key,
      this.isObscure = false,
      this.hintText,
      this.borderRadius,
      this.fillColor,
      this.controller,
      this.validator,
      this.inputType,
      this.suffixWidget,
      this.maxLines, required this.readOnly, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: TextFormField(
        obscureText: isObscure,
        controller: controller,
        textInputAction: TextInputAction.next,
        keyboardType: inputType,
        readOnly: readOnly,
        onTap: onTap,

        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This field is required";
          }
          return null;
        },
        // maxLines: isObscure ? null : maxLines,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.only(left: 10),
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 23,fontWeight: FontWeight.w500),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 10),
          ),
        ),
      ),
    );
  }
}
