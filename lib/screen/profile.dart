import 'dart:io';
import 'package:taste_troop/auth/auth.dart';
import 'package:taste_troop/initial/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfileScreen> {
  late SharedPreferences prefs;
  final String _keyUsername = "username";
  final String _keyPassword = "password";
  String? _usernameValue;
  final Authentication _auth = Authentication();
  final ImagePicker _imagePicker = ImagePicker();
  File? _pickedImage;

  void _loadData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _usernameValue = prefs.getString(_keyUsername);
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
    _auth.signOut();
    Navigator.push(
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
          _pickedImage = File(pickedFile.path);
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
                    child: _pickedImage != null
                        ? Image.file(
                            _pickedImage!,
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
            onTap: () {},
            iconColor: Colors.black,
            leading: Icon(Icons.rule_outlined),
            trailing: Icon(Icons.keyboard_arrow_right_outlined),
            title: const Text(
              'Syarat dan Ketentuan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {},
            iconColor: Colors.black,
            leading: Icon(Icons.privacy_tip_outlined),
            trailing: Icon(Icons.keyboard_arrow_right_outlined),
            title: const Text(
              'Kebijakan Privasi',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {},
            iconColor: Colors.black,
            leading: Icon(Icons.star_outline),
            trailing: Icon(Icons.keyboard_arrow_right_outlined),
            title: const Text(
              'Rating Aplikasi',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {},
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
