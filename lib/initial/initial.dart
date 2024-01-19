import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/auth/register.dart';
import '/screen/navigation.dart';
import '/initial/components/button.dart';
import '/auth/login.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});
  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  late SharedPreferences prefs;
  final String _keyUsername = "username";
  final String _keyPassword = "password";
  String? _usernameValue;
  String? _passwordValue;

  void _loadData() async {
    prefs = await SharedPreferences.getInstance();
    _passwordValue = prefs.getString(_keyPassword);
    _usernameValue = prefs.getString(_keyUsername);
    if (_usernameValue != null &&
        _passwordValue != null &&
        _usernameValue != '' &&
        _passwordValue != '') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => navigationScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Image(
                  image: AssetImage(
                    'assets/logo/logo-darkmode.png',
                  ),
                  width: 150,
                ),
                Image(
                  image: AssetImage(
                    'assets/logo/teks-darkmode.png',
                  ),
                  width: 200,
                ),
              ],
            ),
            Container(
              height: 350,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0.8),
                    Colors.white.withOpacity(0.6),
                    Colors.white.withOpacity(0),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Selamat datang di TasteTroop!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "Catering dengan makanan yang sehat.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(
                        teks: "Masuk",
                        fungsi: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                      ),
                      MyButton(
                        teks: "Daftar",
                        fungsi: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Dengan login atau daftar, berarti kamu menyetujui Syarat Ketentuan dan Kebijakan Privasi",
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
