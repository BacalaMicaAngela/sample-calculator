import 'package:flutter/material.dart';

class ButtonWid extends StatefulWidget {
  ButtonWid(
      {required this.buttonColor, required this.buttonText, required this.buttonTextColor, this.onPressed});

  Color buttonColor;
  String buttonText;
  Color buttonTextColor;
  final VoidCallback? onPressed;

  @override
  State createState() => _ButtonWidState();
}

class _ButtonWidState extends State<ButtonWid> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Container(
          decoration: BoxDecoration(
            color: widget.buttonColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              widget.buttonText,
              style: TextStyle(
                  color: widget.buttonTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}