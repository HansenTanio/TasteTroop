import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String teks;
  final VoidCallback fungsi;

  const MyButton({
    super.key,
    required this.teks,
    required this.fungsi,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(170, 50.0),
          maximumSize: Size(MediaQuery.of(context).size.width, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: Colors.green),
      onPressed: fungsi,
      child: Text(
        teks,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
