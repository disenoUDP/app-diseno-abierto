import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

// import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart' show rootBundle;

Future<String> loadAsset() async {
  return rootBundle.loadString('assets/talleres.json');
}

Future<List<Taller>> fetchTalleres(http.Client client) async {
  final response = await client
      // .get(Uri.parse('https://raw.githubusercontent.com/janisepulveda/app-diseno-abierto/main/mapa_diseno_abierto/assets/talleres.json'));
       .get(Uri.parse('assets/talleres.json'));
       // TODO: tutorial aqui https://docs.flutter.dev/ui/assets/assets-and-images

  // Use the compute function to run parseTalleres in a separate isolate.
  return compute(parseTalleres, response.body);
}

// A function that converts a response body into a List<Taller>.
List<Taller> parseTalleres(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed.map<Taller>((json) => Taller.fromJson(json)).toList();
}

class Taller {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Taller({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl
  });

  factory Taller.fromJson(Map<String, dynamic> json) {
    return Taller(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // this widget is the root of your application
  @override
  Widget build(BuildContext context) {
    const appTitle = 'demo';

    return const MaterialApp(
      // theme: ThemeData(useMaterial3: true),
      title: appTitle,
      home: MyHomePage(title: appTitle),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  Widget build(context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            '#disenoabiertoudp',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, fontFamily: 'Poppins', color: Color(0xFFF801AE)),
          ),
          backgroundColor: Colors.white,
          bottom: const TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.maps_home_work_outlined, color: Color(0xFFF801AE)),

            ),
            Tab(
              icon: Icon(Icons.map_outlined, color: Color(0xFFF801AE)),
            ),
            Tab(
              icon: Icon(Icons.checklist_outlined, color: Color(0xFFF801AE)),
            ),
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            FutureBuilder<List<Taller>>(
              future: fetchTalleres(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('An error has occurred!',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
                    ),
                  );
                } else if (snapshot.hasData) {
                  return TalleresList(talleres: snapshot.data!);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Center(
              child: Column(
                children: [

                    const Padding(

                    // ver como poner el texto en la parte superior izquierda
                    padding: EdgeInsets.all(10),
                    child: Positioned(
                      top: 10,
                      left: 10,
                      child: Text(
                      textAlign: TextAlign.left,
                      'Primera planta', 
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, fontFamily: 'Poppins', color: Color(0xFFF801AE)),
                    ),
                   ),     
                  ),

                  SvgPicture.asset(

                    // revisar el mapa en illustrator
                    'assets/mapa/planta1.svg',
                    width: 400,
                    height: 400,
                  ),

                  SvgPicture.asset(

                    // revisar el mapa en illustrator
                    'assets/mapa/planta2.svg',
                    width: 400,
                    height: 400,
                  ),

                  SvgPicture.asset(

                    // revisar el mapa en illustrator
                    'assets/mapa/planta3.svg',
                    width: 400,
                    height: 400,
                  ),
                  
                ],
              )
            ),
            const Center(
              child: Text(
                'Talleres',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TalleresList extends StatelessWidget {
  const TalleresList({super.key, required this.talleres});

  final List<Taller> talleres;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: talleres.length,
      itemBuilder: (context, index) {
        return Image.network(talleres[index].thumbnailUrl);
      },
    );
  }
}
