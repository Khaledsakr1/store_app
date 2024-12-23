import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  Button({this.ontap, required this.title});
  VoidCallback? ontap;
  String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          //color: Colors.white,
          color: Color(0xffC7EDE6),
          borderRadius: BorderRadius.circular(12),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              shadows: [
                Shadow(
                  color: Colors.black45,
                  blurRadius: 50,
                  offset: Offset(2, 2), // Text shadow offset
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}