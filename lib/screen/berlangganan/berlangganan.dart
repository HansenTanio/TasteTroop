import 'package:flutter/material.dart';

class BerlanggananScreen extends StatefulWidget {
  const BerlanggananScreen({super.key});

  @override
  State<BerlanggananScreen> createState() => _BerlanggananScreenState();
}

class _BerlanggananScreenState extends State<BerlanggananScreen> {
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
        ),
        CateringPackageCard(
          image: 'kotak_extra.png',
          title: 'Paket Premium',
          menu: 'Nasi + 5 Menu',
          boxType: 'Bento',
          price: '500k/Bulan',
          description: 'Porsi Lebih Banyak dari pada paket reguler.',
        ),
        CateringPackageCard(
          image: 'kotak_keluarga.png',
          title: 'Paket Keluarga',
          menu: '1 Mangkok Rantangan Nasi + 5 Menu',
          boxType: 'Rantangan',
          price: '1.2jt/Bulan',
          description: 'Porsi Banyak Cukup untuk 1 keluarga (3-4 orang).',
        ),
      ],
    );
  }
}

class CateringPackageCard extends StatelessWidget {
  final String image;
  final String title;
  final String menu;
  final String boxType;
  final String price;
  final String description;

  CateringPackageCard({
    required this.image,
    required this.title,
    required this.menu,
    required this.boxType,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/$image'), // Ganti dengan path gambar yang sesuai
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white
                .withOpacity(0.7), // Warna putih dengan tingkat opasitas 0.7
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text('Menu: $menu'),
                Text('Jenis Kotak: $boxType'),
                Text('Harga: $price'),
                SizedBox(height: 8.0),
                Text(description),
                SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // Menampilkan dialog pembelian
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return PurchaseDialog();
                      },
                    );
                  },
                  child: Text('Beli Sekarang'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PurchaseDialog extends StatefulWidget {
  @override
  _PurchaseDialogState createState() => _PurchaseDialogState();
}

class _PurchaseDialogState extends State<PurchaseDialog> {
  int selectedMonths = 1;
  String address = '';
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:
          Text('Pilih Jumlah Bulan, Masukkan Alamat, dan Nomor WhatsApp (WA)'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButton<int>(
              value: selectedMonths,
              onChanged: (value) {
                setState(() {
                  selectedMonths = value!;
                });
              },
              items: [1, 2, 3, 4, 5, 6]
                  .map((months) => DropdownMenuItem<int>(
                        value: months,
                        child: Text('$months Bulan'),
                      ))
                  .toList(),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  address = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Alamat',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  phoneNumber = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Nomor WhatsApp (WA)',
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Tambahkan logika untuk memproses pembelian
            // Di sini Anda dapat menggunakan nilai selectedMonths, address, dan phoneNumber
            Navigator.of(context).pop(); // Menutup dialog
          },
          child: Text('Beli'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Menutup dialog
          },
          child: Text('Batal'),
        ),
      ],
    );
  }
}
