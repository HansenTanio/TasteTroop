// import 'package:cateringapp/backend/data/models/auth.dart';
import 'package:taste_troop/initial/splash.dart';
import 'package:flutter/material.dart';
// import 'SettingPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taste_troop/main.dart';

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
  // final Authentication _auth = Authentication();

  // void _loadData() async {
  //   prefs = await SharedPreferences.getInstance();
  //   _usernameValue = prefs.getString(_keyUsername);
  // }

  @override
  void initState() {
    super.initState();
    // _loadData();
  }

  // Future<void> _logout() async {
  //   prefs = await SharedPreferences.getInstance();
  //   prefs.setString(_keyUsername, "");
  //   prefs.setString(_keyPassword, "");
  //   _auth.signOut();
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => FirstPage(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/logo/logo-darkmode.png'),
            radius: 50,
          ),
          // Text(
          //   '${_usernameValue.toString().replaceAll("@gmail.com", "")}',
          //   style: TextStyle(fontWeight: FontWeight.bold),
          // ),
          // Text(_usernameValue.toString()),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Hansen Tanio",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Text(
            "hansentanio33@gmail.com",
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
