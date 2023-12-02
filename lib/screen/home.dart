import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:taste_troop/screen/components/carousel.dart';
import 'package:taste_troop/screen/components/hari.dart';
import 'package:taste_troop/screen/models/menu_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _selectedDate = DateTime.now();
  int _selectedIndex = 0;
  List<MenuModel> _menuReguler = [];
  List<MenuModel> _menuPremium = [];
  List<MenuModel> _menuKeluarga = [];

  void getData() async {
    FirebaseFirestore db = await FirebaseFirestore.instance;
    var reguler = await db.collection('reguler').get();
    var premium = await db.collection('premium').get();
    var keluarga = await db.collection('keluarga').get();
    setState(() {
      _menuReguler =
          reguler.docs.map((doc) => MenuModel.fromDocSnapshot(doc)).toList();
      _menuPremium =
          premium.docs.map((doc) => MenuModel.fromDocSnapshot(doc)).toList();
      _menuKeluarga =
          keluarga.docs.map((doc) => MenuModel.fromDocSnapshot(doc)).toList();
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GambarCarousel(),
        Row(
          children: List.generate(7, (index) {
            final tabDate = _selectedDate.add(Duration(days: index));
            return buildTabButton(index, tabDate);
          }),
        ),
        Expanded(
          child: IndexedStack(
            index: _selectedIndex,
            children: [
              Hari(
                menuReguler: _menuReguler,
                menuPremium: _menuPremium,
                menuKeluarga: _menuKeluarga,
              ),
              Hari(
                menuReguler: _menuReguler,
                menuPremium: _menuPremium,
                menuKeluarga: _menuKeluarga,
              ),
              Hari(
                menuReguler: _menuReguler,
                menuPremium: _menuPremium,
                menuKeluarga: _menuKeluarga,
              ),
              Hari(
                menuReguler: _menuReguler,
                menuPremium: _menuPremium,
                menuKeluarga: _menuKeluarga,
              ),
              Hari(
                menuReguler: _menuReguler,
                menuPremium: _menuPremium,
                menuKeluarga: _menuKeluarga,
              ),
              Hari(
                menuReguler: _menuReguler,
                menuPremium: _menuPremium,
                menuKeluarga: _menuKeluarga,
              ),
              Hari(
                menuReguler: _menuReguler,
                menuPremium: _menuPremium,
                menuKeluarga: _menuKeluarga,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTabButton(int index, DateTime tabDate) {
    final List<String> dayNames = [
      'Sen',
      'Sel',
      'Rab',
      'Kam',
      'Jum',
      'Sab',
      'Min'
    ];
    final String dayName = dayNames[tabDate.weekday - 1];

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 15, left: 10, right: 10),
          child: Container(
            width: 35.0,
            height: 35.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == _selectedIndex ? Colors.green : Colors.grey,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dayName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    '${tabDate.day}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
