import 'archivos.dart' as archivos;
import 'estilo.dart' as estilo;
import 'inicio.dart' as inicio;
import 'taller.dart' as taller;

import 'dart:async';
import 'dart:convert';
// import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

// Future<String> loadAsset() async {
//   // return rootBundle.loadString('assets/talleres.json');
//   return rootBundle.loadString('assets/photos.json');
// }

Future<List<taller.Taller>> fetchTalleres(http.Client client) async {
  final response = await client.get(Uri.parse(archivos.talleresJSON));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    //return Taller.fromJson(jsonDecode(response.body));
    return compute(parseTalleres, response.body);
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('No pudimos cargar talleres');
  }
}

// A function that converts a response body into a List<Taller>.
List<taller.Taller> parseTalleres(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed
      .map<taller.Taller>((json) => taller.Taller.fromJson(json))
      .toList();
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Diseño Abierto UDP';

    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(seedColor: estilo.colorPrincipal),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    const colorSubheader = Color(0xFF005EB8);

    BoxDecoration decoracionInicio = BoxDecoration(
        color: Colors.white,
        border: Border.all(color: colorSubheader),
        boxShadow: const [
          BoxShadow(
            color: estilo.sombra,
            blurRadius: 3,
            offset: Offset(4, 8), // Shadow position
          ),
        ]);

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.

    // https://api.flutter.dev/flutter/material/DefaultTabController-class.html
    return DefaultTabController(
      // 0 para que parta al principio
      initialIndex: 0,
      // 0 es el inicio, 1 es el mapa, 2 son los talleres, 3 son los proyectos
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            '#disenoabiertoudp',
            style: estilo.estiloHeader,
          ),
          backgroundColor: estilo.colorFondo,
          bottom: const TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home_outlined, color: estilo.colorIcono),
              text: 'Inicio',
            ),
            Tab(
              icon: Icon(Icons.room_outlined, color: estilo.colorIcono),
              text: 'Mapa',
            ),
            Tab(
                icon:
                    Icon(Icons.auto_awesome_outlined, color: estilo.colorIcono),
                text: 'Talleres'),
            Tab(
                icon: Icon(Icons.auto_awesome_motion_outlined,
                    color: estilo.colorIcono),
                text: 'Proyectos'),
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            // pos0
            Column(
              children: [
                const Spacer(),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: decoracionInicio,
                  child: InkWell(
                    onTap: () => launchUrl(Uri.parse(
                        'https://www.instagram.com/explore/tags/disenoabiertoudp/')),
                    child: const Text(
                      inicio.definicionDisenoAbierto,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: colorSubheader),
                    ),
                  ),
                  // const Text(
                  //   'diseño abierto es una muestra semestral de los resultados de taller por los estudiantes de la Escuela de Diseño UDP.',
                  //   style: TextStyle(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w500,
                  //       fontFamily: 'Poppins',
                  //       color: colorSubheader),
                  // ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: decoracionInicio,
                  child: const Text(
                    inicio.definicionApp,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        color: colorSubheader),
                  ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: decoracionInicio,
                  child: const Text(
                    inicio.creditosApp,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        color: colorSubheader),
                  ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: decoracionInicio,
                  child: const Text(
                    inicio.materialesApp,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        color: colorSubheader),
                  ),
                ),
                const Spacer(),
              ],
            ),
            // pos1
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Expanded(
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Positioned(
                            left: 21,
                            top: 190,
                            child: Padding(
                              padding: const EdgeInsets.all(31.21),
                              child: Stack(
                                children: [
                                  FadeInImage.memoryNetwork(
                                      fit: BoxFit.contain,
                                      placeholder: kTransparentImage,
                                      width: 540,
                                      height: 540,
                                      image: archivos.imagenPlanta1),
                                  // primer texto
                                  const Positioned(
                                    top: 70,
                                    left: 0,
                                    child: Text(
                                      'Primera planta',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Poppins',
                                          color: colorSubheader),
                                    ),
                                  ),

                                  FadeInImage.memoryNetwork(
                                      fit: BoxFit.contain,
                                      placeholder: kTransparentImage,
                                      width: 400,
                                      height: 400,
                                      image: archivos.imagenPlanta2),
                                  // segundo texto
                                  const Positioned(
                                    top: 500,
                                    left: 0,
                                    child: Text(
                                      'Segunda planta',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Poppins',
                                          color: colorSubheader),
                                    ),
                                  ),

                                  FadeInImage.memoryNetwork(
                                      fit: BoxFit.contain,
                                      placeholder: kTransparentImage,
                                      width: 400,
                                      height: 400,
                                      image: archivos.imagenPlanta3),
                                  // tercer texto
                                  const Positioned(
                                    top: 780,
                                    left: 0,
                                    child: Text(
                                      'Tercera planta',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Poppins',
                                          color: colorSubheader),
                                    ),
                                  ),
                                ],
                              ),
                            )))
                  ],
                ),
              ),
            ),
            // pos2
            FutureBuilder<List<taller.Taller>>(
              future: fetchTalleres(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      'cargando info...!',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins'),
                    ),
                  );
                } else if (snapshot.hasData) {
                  //return TalleresList(talleres: snapshot.data!);
                  return Stack(
                    children: [
                      taller.TalleresList(talleres: snapshot.data!),
                      const Text("bla"),
                    ],
                    // TalleresList(talleres: snapshot.data!),
                    // Text("bla"),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            // pos3
            FutureBuilder<List<taller.Taller>>(
              future: fetchTalleres(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      'cargando info...!',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins'),
                    ),
                  );
                } else if (snapshot.hasData) {
                  return taller.TalleresList(talleres: snapshot.data!);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
