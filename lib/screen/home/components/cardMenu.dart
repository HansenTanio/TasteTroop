import 'package:flutter/material.dart';
import '/screen/home/models/menu_model.dart';

class CardMenu extends StatefulWidget {
  final MenuModel menu;
  const CardMenu({super.key, required this.menu});

  @override
  State<CardMenu> createState() => _CardMenuState();
}

class _CardMenuState extends State<CardMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        height: 300,
        width: 150,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(10.0), // Atur radius sesuai keinginan Anda
          color: Colors.green,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0), // Radius sudut atas kiri
                topRight: Radius.circular(10.0), // Radius sudut atas kanan
              ),
              child: Image(
                image: NetworkImage(widget.menu.gambar),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.menu.nama}",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Komposisi: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: '${widget.menu.komposisi.join(", ")}',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Jumlah Porsi: ${widget.menu.jumlahPorsi}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
