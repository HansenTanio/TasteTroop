import 'package:flutter/material.dart';

class PrivasiScreen extends StatelessWidget {
  const PrivasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kebijakan Privasi",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset('assets/logo/logo.png', width: 100),
          Image.asset('assets/logo/teks.png', width: 200),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Pendahuluan',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Selamat datang di aplikasi catering kami. Kebijakan privasi ini menjelaskan bagaimana kami mengumpulkan, menggunakan, dan melindungi informasi pribadi Anda. Dengan menggunakan aplikasi kami, Anda setuju untuk tunduk pada praktik privasi yang dijelaskan dalam kebijakan ini.\n',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Informasi yang Dikumpulkan',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Kami mengumpulkan informasi pribadi seperti nama, alamat, nomor telepon, alamat email, dan informasi pembayaran saat Anda menggunakan aplikasi kami untuk memesan layanan catering.\n',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Penggunaan Informasi',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Informasi pribadi Anda digunakan untuk memproses pemesanan, mengatur pengiriman, dan berkomunikasi terkait layanan catering. Kami juga dapat menggunakan informasi untuk analisis internal dan peningkatan layanan.\n',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Keamanan Informasi',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Kami mengambil langkah-langkah keamanan fisik, elektronik, dan administratif untuk melindungi informasi pribadi Anda dari akses yang tidak sah atau pengungkapan.\n',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Penyimpanan Informasi',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Informasi pribadi Anda disimpan selama diperlukan untuk memenuhi tujuan pemesanan dan persyaratan hukum yang berlaku.\n',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Pemberian Informasi kepada Pihak Ketiga',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Informasi pribadi Anda tidak akan dibagikan atau dijual kepada pihak ketiga tanpa izin Anda, kecuali jika diperlukan oleh hukum atau untuk melaksanakan layanan catering.\n',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Pembaruan Informasi Pribadi',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Anda dapat mengakses dan memperbarui informasi pribadi Anda melalui akun pengguna di aplikasi kami.\n',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Cookie dan Teknologi Pelacakan',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Kami dapat menggunakan cookie dan teknologi pelacakan lainnya untuk meningkatkan pengalaman pengguna dan mengumpulkan informasi tentang penggunaan aplikasi.\n',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Iklan',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Informasi yang dikumpulkan dapat digunakan untuk menyajikan iklan yang lebih sesuai dengan minat Anda.\n',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Perubahan Kebijakan Privasi',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Kebijakan privasi ini dapat direvisi sesuai kebutuhan, dan setiap perubahan akan diinformasikan kepada Anda melalui pembaruan kebijakan di aplikasi.\n',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Dengan menggunakan aplikasi catering kami, Anda setuju untuk tunduk pada kebijakan privasi ini. Harap periksa kebijakan ini secara berkala untuk memahami bagaimana informasi pribadi Anda dikelola.\n',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Hubungi Kami',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'e-mail: aaa@gmail.com\n Nomor Telepon: 081234567890\n Pusat Bantuan di aplikasi Taste Troop\n',
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Terakhir diperbarui tanggal 17 Desember 2023\n',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
