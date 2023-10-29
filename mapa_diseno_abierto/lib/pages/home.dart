import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(const TabBarApp());

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const TabBarExample(),
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
          centerTitle: true,
          title: const Text(
            '#disenoabiertoudp',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.maps_home_work_outlined),
            ),
            Tab(
              icon: Icon(Icons.map_outlined),
            ),
            Tab(
              icon: Icon(Icons.checklist_outlined),
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

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

  // @override
  // Widget build(BuildContext context) {
    // return const Scaffold(
    // );
  // }
// }