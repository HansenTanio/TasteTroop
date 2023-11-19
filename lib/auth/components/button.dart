import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onpressed;
  final String text;
  MyButton({
    super.key,
    required this.onpressed,
    required this.text,
  });
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(300, 50.0),
        maximumSize: Size(MediaQuery.of(context).size.width, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: onpressed,
      child: Text(text),
    );
  }
}
