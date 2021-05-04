import 'package:caritukang/page/payment/layout.dart';
import 'package:caritukang/page/summary_order/layout.dart';
import "package:flutter/material.dart";
import 'page/home/layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF4B67AF),
        accentColor: Color(0xFF483392),
      ),
      routes: {
        "/": (context) => HomePage(),
        "/summary-order": (context) => SummaryOrderPage(),
        "/payment": (context) => PaymentPage(),
      },
    );
  }
}
