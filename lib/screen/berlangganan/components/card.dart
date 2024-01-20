import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taste_troop/screen/profile/Models/userModel.dart';

class CateringPackageCard extends StatefulWidget {
  final String image;
  final String title;
  final String menu;
  final String boxType;
  final String price;
  final String description;
  final UserModel user;

  CateringPackageCard({
    super.key,
    required this.image,
    required this.title,
    required this.menu,
    required this.boxType,
    required this.price,
    required this.description,
    required this.user,
  });

  @override
  State<CateringPackageCard> createState() => _CateringPackageCardState();
}

class _CateringPackageCardState extends State<CateringPackageCard> {
  int selectedMonths = 1;
  String selectedAddress = "Rumah";
  String phoneNumber = "";
  String _pass = "";
  late SharedPreferences prefs;
  final String _keyPassword = "password";

  late InterstitialAd _interstitialAd;
  bool _isInterstitialReady = false;
  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: "ca-app-pub-3940256099942544/1033173712",
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              print("Close Interstitial Add");
            },
          );
          setState(() {
            _isInterstitialReady = true;
            _interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          _isInterstitialReady = false;
          _interstitialAd.dispose();
        },
      ),
    );
  }

  void loadUser() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/${widget.image}'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text('Menu: ${widget.menu}'),
                Text('Jenis Kotak: ${widget.boxType}'),
                Text('Harga: ${widget.price}'),
                SizedBox(height: 8.0),
                Text(widget.description),
                SizedBox(height: 8.0),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    _loadInterstitialAd();
                    if (_isInterstitialReady) {
                      _interstitialAd.show();
                    }
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                              'Pilih Jumlah Bulan, Masukkan Alamat, dan Nomor WhatsApp (WA)'),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                DropdownButtonFormField<int>(
                                  onChanged: (_) {},
                                  onSaved: (value) {
                                    setState(() {
                                      selectedMonths = value!;
                                    });
                                  },
                                  value: selectedMonths,
                                  items: [1, 2, 3, 4, 5, 6]
                                      .map((months) => DropdownMenuItem<int>(
                                            value: months,
                                            child: Text('$months Bulan'),
                                          ))
                                      .toList(),
                                ),
                                SizedBox(height: 16.0),
                                DropdownButtonFormField<String>(
                                  onChanged: (_) {},
                                  onSaved: (value) {
                                    setState(() {
                                      selectedAddress = value!;
                                    });
                                    selectedAddress = value!;
                                  },
                                  value: selectedAddress,
                                  items: ["Kampus", "Kantor", "Rumah"]
                                      .map(
                                          (address) => DropdownMenuItem<String>(
                                                value: address,
                                                child: Text('$address'),
                                              ))
                                      .toList(),
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
                                Navigator.of(context).pop();
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Konfirmasi Pembayaran"),
                                      content: SingleChildScrollView(
                                        child: Column(children: [
                                          SizedBox(height: 10.0),
                                          TextFormField(
                                            obscureText: true,
                                            onChanged: (value) {
                                              setState(() {
                                                _pass = value;
                                              });
                                            },
                                            decoration: InputDecoration(
                                              labelText: 'Masukkan Password',
                                            ),
                                          ),
                                        ]),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            loadUser();
                                            Navigator.of(context).pop();
                                            if (_pass ==
                                                prefs.getString(_keyPassword)) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                paymentSuccess(context),
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                paymentFail(context),
                                              );
                                            }
                                          },
                                          child: Text('Submit'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text('Beli'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Batal'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    'Beli Sekarang',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

paymentSuccess(BuildContext context) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.green,
    duration: Duration(seconds: 3),
    content: Text('Pembayaran Berhasil!'),
    action: SnackBarAction(
      label: 'Tutup',
      textColor: Colors.white,
      onPressed: () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
    ),
  );
}

paymentFail(BuildContext context) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.red,
    duration: Duration(seconds: 3),
    content: Text('Pembayaran Gagal!'),
    action: SnackBarAction(
      label: 'Tutup',
      textColor: Colors.white,
      onPressed: () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
    ),
  );
}
