import 'package:flutter/material.dart';
import 'package:taste_troop/screen/components/cardMenu.dart';
import 'package:taste_troop/screen/models/menu_model.dart';

class Hari extends StatefulWidget {
  List<MenuModel> menuReguler = [];
  List<MenuModel> menuPremium = [];
  List<MenuModel> menuKeluarga = [];
  Hari({
    super.key,
    required this.menuReguler,
    required this.menuPremium,
    required this.menuKeluarga,
  });

  @override
  State<Hari> createState() => _HariState();
}

class _HariState extends State<Hari> {
  @override
  Widget build(BuildContext context) {
    widget.menuReguler.shuffle();
    widget.menuPremium.shuffle();
    widget.menuKeluarga.shuffle();
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              height: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Menu Langganan Regular : 400k",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: Row(
                        children: List.generate(
                          widget.menuReguler.take(4).length,
                          (index) => CardMenu(
                            menu: widget.menuReguler[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 20,
              color: Colors.black,
            ),
            Container(
              height: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Menu Langganan Premium : 600k",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: Row(
                        children: List.generate(
                          widget.menuPremium.take(5).length,
                          (index) => CardMenu(
                            menu: widget.menuPremium[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 10,
              color: Colors.black,
            ),
            Container(
              height: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Menu Langganan Regular : 1.2jt",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: Row(
                        children: List.generate(
                          widget.menuKeluarga.take(5).length,
                          (index) => CardMenu(
                            menu: widget.menuKeluarga[index],
                          ),
                        ),
                      ),
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
