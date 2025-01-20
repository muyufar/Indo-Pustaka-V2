import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IPCustomButton extends StatefulWidget {
  final Function onPressed;
  final String title;

  const IPCustomButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  State<IPCustomButton> createState() => IPCustomButtonState();
}

class IPCustomButtonState extends State<IPCustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        16.0,
        16.0,
        16.0,
        16.0,
      ),
      child: Container(
        width: Get.width,
        height: 50,
        child: ElevatedButton(
          onPressed: () => widget.onPressed,
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(   
            backgroundColor: Colors.orange[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
