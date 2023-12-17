import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taste_troop/screen/profile/setting/privasi.dart';
import '/auth/auth.dart';
import '/initial/splash.dart';
import '/screen/profile/setting/syarat&ketentuan.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfileScreen> {
  late SharedPreferences prefs;
  final String _keyUsername = "username";
  final String _keyPassword = "password";
  final String _keyImagePath = "imagePath";
  String? _usernameValue;
  String? _pickedImagePath;
  final Authentication _auth = Authentication();
  final ImagePicker _imagePicker = ImagePicker();

  void _loadData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _usernameValue = prefs.getString(_keyUsername);
      _pickedImagePath = prefs.getString(_keyImagePath);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _logout() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString(_keyUsername, "");
    prefs.setString(_keyPassword, "");
    _auth.logOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SplashScreen(),
      ),
    );
  }

  void getImage() async {
    var status = await Permission.photos.request();
    if (status == PermissionStatus.granted) {
      final pickedFile =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _pickedImagePath = pickedFile.path;
          prefs.setString(_keyImagePath, _pickedImagePath!);
        });
      }
    } else {
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          Center(
            child: Stack(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.white,
                    ),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: _pickedImagePath != null
                        ? Image.file(
                            File(_pickedImagePath!),
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/logo/user.jpg',
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 5,
                        color: Colors.white,
                      ),
                      color: Colors.green,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt_rounded),
                      color: Colors.white,
                      onPressed: getImage,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${_usernameValue.toString().replaceAll("@gmail.com", "")}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Text(
            _usernameValue.toString(),
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {},
            iconColor: Colors.black,
            leading: Icon(Icons.map_outlined),
            trailing: Icon(Icons.keyboard_arrow_right_outlined),
            title: const Text(
              'Alamat Tersimpan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SyaratScreen(),
                ),
              );
            },
            iconColor: Colors.black,
            leading: Icon(Icons.rule_outlined),
            trailing: Icon(Icons.keyboard_arrow_right_outlined),
            title: const Text(
              'Syarat dan Ketentuan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PrivasiScreen(),
                ),
              );
            },
            iconColor: Colors.black,
            leading: Icon(Icons.privacy_tip_outlined),
            trailing: Icon(Icons.keyboard_arrow_right_outlined),
            title: const Text(
              'Kebijakan Privasi',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {
              _showBottomDialog(context);
            },
            iconColor: Colors.black,
            leading: Icon(Icons.chat_outlined),
            trailing: Icon(Icons.keyboard_arrow_right_outlined),
            title: const Text(
              'Layanan Pengaduan Konsumen',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: _logout,
            iconColor: Colors.black,
            leading: Icon(Icons.logout),
            trailing: Icon(Icons.keyboard_arrow_right_outlined),
            title: const Text(
              'Logout',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

void _showBottomDialog(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Layanan Pengaduan Konsumen',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo/logo.png', width: 50),
                Image.asset('assets/logo/teks.png', width: 100),
              ],
            ),
            Text(
              'PT Taste Troop Indonesia\ne-mail: aaa@gmail.com\n Nomor Telepon: 081234567890',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.0),
            ),
          ],
        ),
      );
    },
  );
}
