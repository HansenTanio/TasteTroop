import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '/screen/berlangganan/berlangganan.dart';
import '/screen/home/home.dart';
import '/screen/profile/profile.dart';
import '/screen/referensi/referensi.dart';

class navigationScreen extends StatefulWidget {
  const navigationScreen({super.key});

  @override
  State<navigationScreen> createState() => _navigationScreenState();
}

class _navigationScreenState extends State<navigationScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int _selectedBottomIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedBottomIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return DialogPilihAlamat2();
                // }));
              },
              child: Text("Pilih Alamat"),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Image.asset('assets/logo/logo.png', width: 50),
                  Image.asset('assets/logo/teks.png', width: 80),
                ],
              ),
            ),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Container(
            child: HomeScreen(),
          ),
          Container(
            child: BerlanggananScreen(),
          ),
          Container(
            child: ReferensiScreen(),
          ),
          Container(
            child: ProfileScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sell_outlined),
            label: 'Berlangganan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Tutorial',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_sharp),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedBottomIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
