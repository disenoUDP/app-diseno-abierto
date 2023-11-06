import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(const TabBarApp());

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const TabBarExample(),
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            '#disenoabiertoudp',
            style: TextStyle(fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w600, color: Color(0xFFF801AE)),
          ),
          bottom: const TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.maps_home_work_outlined, color: Color(0xFFF801AE)),
            ),
            Tab(
              icon: Icon(Icons.map_outlined, color: Colors.black,),
            ),
            Tab(
              icon: Icon(Icons.checklist_outlined, color: Colors.black),
            ),
          ]),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text(
                'Diseño abierto UDP',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
              ),
            ),
            Center(
              child: Text(
                'Mapa',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
              ),
            ),
            Center(
              child: Text(
                'Talleres',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
