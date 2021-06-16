import 'package:flutter/material.dart';
import 'package:khyatee_app/homepage/pump_screen.dart';
import 'package:khyatee_app/homepage/tank_screen.dart';

import '../strings.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          Strings.home,
          style: TextStyle(fontSize: 16),
        ),
        brightness: Brightness.light,
        backgroundColor: const Color(0xFF214D72),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: PumpScreen(),

            ),


            Container(
              child: TankScreen(),
            ),


          ],
        ),
      ),
    );
  }
}
