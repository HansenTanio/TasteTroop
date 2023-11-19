import 'package:flutter/material.dart';
import 'package:taste_troop/home/components/carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _selectedDate = DateTime.now();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GambarCarousel(),
        Row(
          children: List.generate(7, (index) {
            final tabDate = _selectedDate.add(Duration(days: index));
            return buildTabButton(index, tabDate);
          }),
        ),
        Expanded(
          child: IndexedStack(
            index: _selectedIndex,
            children: [
              SingleChildScrollView(
                child: Container(
                    // child: FutureBuilder(
                    //   future: _dbHelper.getMyMenu(),
                    //   builder: (context, snapshot) {
                    //     if (snapshot.connectionState ==
                    //         ConnectionState.waiting) {
                    //       return const Center(
                    //         child: CircularProgressIndicator(),
                    //       );
                    //     } else if (snapshot.hasData) {
                    child: Column(
                  children: [
                    Container(
                      height: 320,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 228, 228, 228)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Menu Langganan Regular : 400k",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20.0,
                                horizontal: 5.0,
                              ),
                              child: Text("tes"),
                              // Row(
                              //   children: List.generate(
                              //     snapshot.data!.length,
                              //     (index) => KotakMenu1(
                              //       menu: snapshot.data![index],
                              //     ),
                              //   ),
                              // ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 20,
                      color: Colors.black,
                    ),
                    Container(
                      height: 320,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 228, 228, 228)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Menu Langganan Premium : 600k",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20.0,
                                horizontal: 5.0,
                              ),
                              child: Text("tes"),
                              // child: Row(
                              //   children: List.generate(
                              //     snapshot.data!.length,
                              //     (index) => KotakMenu1(
                              //       menu: snapshot.data![index],
                              //     ),
                              //   ),
                              // ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 10,
                      color: Colors.black,
                    ),
                    Container(
                      height: 320,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 228, 228, 228)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Menu Langganan Keluarga : 1.2jt",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20.0,
                                horizontal: 5.0,
                              ),
                              child: Text("tes"),
                              // child: Row(
                              //   children: List.generate(
                              //     snapshot.data!.length,
                              //     (index) => KotakMenu1(
                              //       menu: snapshot.data![index],
                              //     ),
                              //   ),
                              // ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
                    //     } else {
                    //       return Text('Data tidak tersedia');
                    //     }
                    //   },
                    // ),
                    ),
              ),
              Container(
                child: Text('Konten untuk Selasa'),
              ),
              Container(
                child: Text('Konten untuk Rabu'),
              ),
              Container(
                child: Text('Konten untuk Kamis'),
              ),
              Container(
                child: Text('Konten untuk Jumat'),
              ),
              Container(
                child: Text('Konten untuk Sabtu'),
              ),
              Container(
                child: Text('Konten untuk Minggu'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTabButton(int index, DateTime tabDate) {
    final List<String> dayNames = [
      'Sen',
      'Sel',
      'Rab',
      'Kam',
      'Jum',
      'Sab',
      'Min'
    ];
    final String dayName = dayNames[tabDate.weekday - 1];

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 15, left: 10, right: 10),
          child: Container(
            width: 35.0,
            height: 35.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == _selectedIndex ? Colors.green : Colors.grey,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dayName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    '${tabDate.day}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
