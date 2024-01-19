import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/screen/berlangganan/components/card.dart';
import '/screen/profile/Models/userModel.dart';

class BerlanggananScreen extends StatefulWidget {
  const BerlanggananScreen({super.key});

  @override
  State<BerlanggananScreen> createState() => _BerlanggananScreenState();
}

class _BerlanggananScreenState extends State<BerlanggananScreen> {
  late SharedPreferences prefs;
  final String _keyUsername = "username";
  List<UserModel> _lstuser = [];
  UserModel _user =
      UserModel(email: "", profileImage: "", alamat: [], label: ["Rumah"]);
  Future<void> _loadData() async {
    prefs = await SharedPreferences.getInstance();
    FirebaseFirestore db = FirebaseFirestore.instance;
    var snapshot = await db.collection('user').get();
    _lstuser =
        snapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList();
    for (UserModel x in _lstuser) {
      if (x.email == prefs.getString(_keyUsername)) {
        _user = x;
      }
    }
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        CateringPackageCard(
          image: 'kotak_regular.png',
          title: 'Paket Reguler',
          menu: 'Nasi + 4 Menu',
          boxType: 'Bento',
          price: '380k/Bulan',
          description:
              'Menggunakan Bento Box dan + 1 menu tambahan dari pada paket hemat.',
          user: _user,
        ),
        CateringPackageCard(
          image: 'kotak_extra.png',
          title: 'Paket Premium',
          menu: 'Nasi + 5 Menu',
          boxType: 'Bento',
          price: '500k/Bulan',
          description: 'Porsi Lebih Banyak dari pada paket reguler.',
          user: _user,
        ),
        CateringPackageCard(
          image: 'kotak_keluarga.png',
          title: 'Paket Keluarga',
          menu: '1 Mangkok Rantangan Nasi + 5 Menu',
          boxType: 'Rantangan',
          price: '1.2jt/Bulan',
          description: 'Porsi Banyak Cukup untuk 1 keluarga (3-4 orang).',
          user: _user,
        ),
      ],
    );
  }
}
