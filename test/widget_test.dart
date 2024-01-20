// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taste_troop/auth/login.dart';
import 'package:taste_troop/auth/register.dart';
import 'package:taste_troop/initial/initial.dart';
import 'package:taste_troop/screen/navigation.dart';
import 'package:taste_troop/screen/profile/setting/alamat.dart';
import 'package:taste_troop/screen/profile/setting/privasi.dart';
import 'package:taste_troop/screen/profile/setting/syarat&ketentuan.dart';

void main() async {
  testWidgets('Initial Screen Login Button', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: InitialScreen(),
    ));
    await tester.tap(find.widgetWithText(ElevatedButton, "Masuk"));
    await tester.pumpAndSettle(const Duration(seconds: 3));
    expect(find.text('Login'), findsAtLeast(1));
  });
  testWidgets('Initial Screen Register Button', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: InitialScreen(),
    ));
    await tester.tap(find.widgetWithText(ElevatedButton, "Daftar"));
    await tester.pumpAndSettle(const Duration(seconds: 3));
    expect(find.text('Register'), findsAtLeast(1));
  });
  testWidgets('Login Textfield', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginScreen(),
    ));
    await tester.enterText(find.byKey(const Key("Email")), 'aaa@gmail.com');
    await tester.enterText(find.byKey(const Key("Password")), '1234567890');
    await tester.pumpAndSettle(const Duration(seconds: 3));
    expect(find.text("aaa@gmail.com"), findsOneWidget);
    expect(find.text("1234567890"), findsOneWidget);
  });
  testWidgets('Register Textfield', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: RegisterScreen(),
    ));
    await tester.enterText(find.byKey(const Key("Email")), 'aaa@gmail.com');
    await tester.enterText(find.byKey(const Key("Password")), '1234567890');
    await tester.enterText(find.byKey(const Key("Confirm")), '1234567890');
    await tester.pumpAndSettle(const Duration(seconds: 3));
    expect(find.text("aaa@gmail.com"), findsOneWidget);
    expect(find.text("1234567890"), findsAtLeast(2));
  });

  testWidgets('Navbar Berlangganan', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: navigationScreen(),
    ));
    await tester.tap(find.byIcon(Icons.sell_outlined));
    await tester.pumpAndSettle();
    expect(find.text("Paket Reguler"), findsOneWidget);
    expect(find.text("Paket Premium"), findsOneWidget);
    expect(find.text("Paket Keluarga"), findsOneWidget);
  });
  testWidgets('Navbar Home', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: navigationScreen(),
    ));
    await tester.tap(find.byIcon(Icons.home));
    await tester.pumpAndSettle();
    expect(find.text("Menu Langganan Regular : 400k"), findsOneWidget);
    expect(find.text("Menu Langganan Premium : 600k"), findsOneWidget);
    expect(find.text("Menu Langganan Keluarga : 1.2jt"), findsOneWidget);
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
