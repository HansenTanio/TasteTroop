import 'package:flutter/material.dart';

class SyaratScreen extends StatelessWidget {
  const SyaratScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Syarat & Ketentuan",
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
                  'Penerimaan Ketentuan Layanan',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Dengan mengakses dan menggunakan aplikasi catering ini, Anda secara otomatis menyetujui dan tunduk pada semua syarat dan ketentuan yang tercantum di bawah ini. Jika Anda tidak menyetujui syarat dan ketentuan ini, harap untuk tidak menggunakan layanan kami.\n',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Penggunaan Aplikasi',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Anda diberikan izin terbatas untuk menggunakan aplikasi catering ini untuk keperluan pemesanan dan pengiriman layanan catering. Dilarang keras melakukan tindakan yang dapat merusak aplikasi atau mengganggu penggunaan layanan oleh pengguna lain.\n',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Pemesanan dan Pembayaran',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Pemesanan layanan catering dapat dilakukan melalui aplikasi. Pembayaran harus dilakukan sesuai dengan metode pembayaran yang tersedia di aplikasi. Pembatalan pesanan dapat dikenakan biaya sesuai dengan kebijakan pembatalan yang berlaku.\n',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Kualitas Makanan',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Meskipun kami berkomitmen untuk menyediakan makanan berkualitas tinggi, kami tidak bertanggung jawab atas ketidakpuasan terkait selera pribadi atau kebutuhan diet tertentu.\n',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Pengiriman dan Layanan',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Waktu pengiriman akan disesuaikan dengan kesepakatan antara penyedia catering dan pelanggan. Pelanggan bertanggung jawab untuk memberikan informasi pengiriman yang akurat.\n',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Tanggung Jawab Pelanggan',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Pelanggan bertanggung jawab untuk menjaga kebersihan dan keamanan lokasi acara. Peralatan catering yang disewakan harus dikembalikan dalam kondisi yang baik, dan pelanggan bertanggung jawab atas kerusakan atau kehilangan.\n',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Privasi dan Keamanan',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Informasi pribadi pelanggan akan dijaga kerahasiaannya sesuai dengan kebijakan privasi yang berlaku. Aplikasi catering ini dapat menggunakan cookie untuk meningkatkan pengalaman pengguna.\n',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Pemutusan Layanan',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Penyedia catering berhak untuk memutuskan layanan jika ditemukan pelanggaran terhadap syarat dan ketentuan ini.\n',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Perubahan Syarat dan Ketentuan',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Syarat dan ketentuan ini dapat diubah atau diperbarui tanpa pemberitahuan sebelumnya. Pengguna diharapkan untuk secara berkala memeriksa syarat dan ketentuan yang berlaku.\n',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Hukum yang Berlaku',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Syarat dan ketentuan ini tunduk pada hukum yang berlaku di wilayah yurisdiksi tempat layanan ini dioperasikan.\n',
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Dengan menggunakan aplikasi catering ini, Anda mengakui bahwa Anda telah membaca, memahami, dan menyetujui semua syarat dan ketentuan yang tercantum di atas.\n',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
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
