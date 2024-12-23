import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Textfield extends StatelessWidget {
  Textfield({this.onchanged, this.inputType , this.headtextfield, this.obscuretext = false});
  String? headtextfield;
  Function(String)? onchanged;

  TextEditingController controller = TextEditingController();
  TextInputType? inputType;
  bool? obscuretext;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscuretext!,
      controller: controller,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            color: Colors.black45,
            blurRadius: 4,
            offset: Offset(2, 2), // Text shadow offset
          ),
        ],
      ),
      keyboardType: inputType,
      onChanged: onchanged,
      decoration: InputDecoration(
        labelText: headtextfield,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          //fontStyle: FontStyle.italic,
          shadows: [
            Shadow(
              color: Colors.black45,
              blurRadius: 7,
              offset: Offset(1, 1), // Text shadow offset
            ),
          ],
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 0, 255, 208),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
