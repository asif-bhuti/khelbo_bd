import 'package:flutter/material.dart';
import './login_page.dart';
import './google_map.dart';
import 'booking_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        title: 'Khelbo Bangladesh',
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (context) => LoginPage(),
          '/map': (context) => MapSample(),
          '/booking': (context) => BookingPage(),
        });
  }
}
