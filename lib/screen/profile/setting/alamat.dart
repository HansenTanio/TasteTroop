import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AlamatScreen extends StatefulWidget {
  List label = [];
  List alamat = [];
  AlamatScreen({
    super.key,
    required this.label,
    required this.alamat,
  });

  @override
  State<AlamatScreen> createState() => _AlamatScreenState();
}

class _AlamatScreenState extends State<AlamatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alamat Tersimpan",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: widget.alamat.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              widget.label[index],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              widget.alamat[index],
            ),
          );
        },
      ),
    );
  }
}
