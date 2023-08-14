import 'package:flutter/material.dart';
import 'package:goagrics/utils/constants.dart';

class GoTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const GoTextField(
      {super.key, required this.label, required this.controller, required});

  @override
  Widget build(BuildContext context) {
    // FocusNode myFocusNode = FocusNode();
    return TextFormField(
      // focusNode: myFocusNode,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        // labelStyle: GoogleFonts.urbanist(
        //     fontSize: 14.0,
        //     color: myFocusNode.hasFocus ? themeColorLight : themeColorDark),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: themeColorLight,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: themeColorBlack,
            width: 1.0,
          ),
        ),
      ),
      validator: (value) {
        if (value!.trim().isEmpty) {
          return 'This Field is Required...';
        }
        return null;
      },
    );
  }
}
