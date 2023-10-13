import 'package:flutter/material.dart';
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
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.directions_boat),
              ),
              Tab(
                icon: Icon(Icons.directions_bus),
              ),
              Tab(
                icon: Icon(Icons.directions_car),
              ),
            ]
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text(
                'Diseño abierto UDP',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal
                ),
              ),
            ),
            Center(
              child: Text(
                'Mapa',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal
                ),
              ),
            ),
            Center(
              child: Text(
                'Talleres',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: const Column(
        // children: [
        //   TextField()
        // ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Esto es una prueba',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),

      // esto cambia en ios y android
      centerTitle: true, 
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {
          
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
          child: SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
            height: 20,
            width: 20,
        ),
        ),
      ),
      
      actions: [
        GestureDetector(
          onTap: () {

          },
          child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          width: 37,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: SvgPicture.asset(
            'assets/icons/dots.svg',
            height: 5,
            width: 5,
          ),
        ),
        ),
      ],
    );
  }
}