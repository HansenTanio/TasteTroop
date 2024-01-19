// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taste_troop/initial/initial.dart';
import 'package:taste_troop/screen/berlangganan/berlangganan.dart';
import 'package:taste_troop/screen/profile/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:taste_troop/screen/profile/setting/alamat.dart';
import 'package:taste_troop/screen/profile/setting/privasi.dart';
import 'package:taste_troop/screen/profile/setting/syarat&ketentuan.dart';

void main() {
  testWidgets('Initial Screen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: InitialScreen(),
    ));
    expect(find.widgetWithText(ElevatedButton, "Masuk"), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, "Daftar"), findsOneWidget);
  });
  testWidgets('Berlangganan Screen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BerlanggananScreen(),
    ));
    expect(find.text("Paket Reguler"), findsOneWidget);
    expect(find.text("Paket Premium"), findsOneWidget);
    expect(find.text("Paket Keluarga"), findsOneWidget);
  });
  testWidgets('Syarat & Ketentuan Screen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SyaratScreen(),
    ));
    expect(find.text("Syarat & Ketentuan"), findsOneWidget);
  });
  testWidgets('Kebijakan Privasi Screen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: PrivasiScreen(),
    ));
    expect(find.text("Kebijakan Privasi"), findsOneWidget);
  });
  testWidgets('Alamat Tersimpan Screen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: AlamatScreen(label: [], alamat: []),
    ));
    expect(find.text("Alamat Tersimpan"), findsOneWidget);
  });
}
