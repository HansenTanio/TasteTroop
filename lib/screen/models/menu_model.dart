import 'package:cloud_firestore/cloud_firestore.dart';

class MenuModel {
  String? id;
  String nama;
  List<dynamic> komposisi;
  int jumlahPorsi;

  MenuModel({
    this.id,
    required this.nama,
    required this.komposisi,
    required this.jumlahPorsi,
  });

  Map<String, dynamic> toMap() {
    return {
      'Nama': nama,
      'Komposisi': komposisi,
      'Jumlah Porsi': jumlahPorsi,
    };
  }

  MenuModel.fromDocSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        nama = doc.data()?['Nama'],
        komposisi = doc.data()?['Komposisi'],
        jumlahPorsi = doc.data()?['Jumlah Porsi'];
}
