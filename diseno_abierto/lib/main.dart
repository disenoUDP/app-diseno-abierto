import 'dart:async';
import 'dart:convert';
// import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';

// Future<String> loadAsset() async {
//   // return rootBundle.loadString('assets/talleres.json');
//   return rootBundle.loadString('assets/photos.json');
// }

Future<List<Taller>> fetchTalleres(http.Client client) async {
  final response = await client.get(Uri.parse(
      'https://raw.githubusercontent.com/disenoUDP/assets/main/diseno-abierto/talleres.json'));
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
List<Taller> parseTalleres(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed.map<Taller>((json) => Taller.fromJson(json)).toList();
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

class Taller {
  final String sigla;
  final String nombre;
  final String docentePrincipal;
  final String docenteAuxiliar;
  final String ayudante;
  final String nivel;
  final String url;
  final String thumbnailUrl;

  const Taller(
      {required this.sigla,
      required this.nombre,
      required this.docentePrincipal,
      required this.docenteAuxiliar,
      required this.ayudante,
      required this.nivel,
      required this.url,
      required this.thumbnailUrl});

  factory Taller.fromJson(Map<String, dynamic> json) {
    return Taller(
      sigla: json['sigla'] as String,
      nombre: json['nombre'] as String,
      docentePrincipal: json['docentePrincipal'] as String,
      docenteAuxiliar: json['docenteAuxiliar'] as String,
      ayudante: json['ayudante'] as String,
      nivel: json['nivel'] as String,
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Diseño Abierto UDP';

    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(248, 1, 174, 1)),
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
  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.

    // https://api.flutter.dev/flutter/material/DefaultTabController-class.html
    return DefaultTabController(
      // 0 para que parta al principio
      initialIndex: 0,
      // 0 es el inicio, 1 es el mapa, 2 son los proyectos
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            '#disenoabiertoudp',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                color: Color(0xFFF801AE)),
          ),
          backgroundColor: Colors.white,
          bottom: const TabBar(tabs: <Widget>[
            Tab(
              icon:
                  Icon(Icons.maps_home_work_outlined, color: Color(0xFFF801AE)),
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
            // pos0
            const Center(
              child: Text(
                'Talleres',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins'),
              ),
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
                                  const Center(
                                    child: Text(
                                      'Mapa Diseño Abierto',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Poppins',
                                          color: Color(0xFFF801AE)),
                                    ),
                                  ),
                                  FadeInImage.memoryNetwork(
                                      fit: BoxFit.contain,
                                      placeholder: kTransparentImage,
                                      width: 540,
                                      height: 540,
                                      image:
                                          'https://raw.githubusercontent.com/disenoUDP/assets/main/diseno-abierto/mapa/planta1.png'),

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
                                          color: Color(0xFFF801AE)),
                                    ),
                                  ),

                                  FadeInImage.memoryNetwork(
                                      fit: BoxFit.contain,
                                      placeholder: kTransparentImage,
                                      width: 400,
                                      height: 400,
                                      image:
                                          'https://raw.githubusercontent.com/disenoUDP/assets/main/diseno-abierto/mapa/planta2.png'),

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
                                          color: Color(0xFFF801AE)),
                                    ),
                                  ),

                                  FadeInImage.memoryNetwork(
                                      fit: BoxFit.contain,
                                      placeholder: kTransparentImage,
                                      width: 400,
                                      height: 400,
                                      image:
                                          'https://raw.githubusercontent.com/disenoUDP/assets/main/diseno-abierto/mapa/planta3.png'),

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
                                          color: Color(0xFFF801AE)),
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
            FutureBuilder<List<Taller>>(
              future: fetchTalleres(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      'An error has occurred!',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins'),
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
          ],
        ),
        // Center(
        //   // Center is a layout widget. It takes a single child and positions it
        //   // in the middle of the parent.
        //   child: Column(
        //     // Column is also a layout widget. It takes a list of children and
        //     // arranges them vertically. By default, it sizes itself to fit its
        //     // children horizontally, and tries to be as tall as its parent.
        //     //
        //     // Column has various properties to control how it sizes itself and
        //     // how it positions its children. Here we use mainAxisAlignment to
        //     // center the children vertically; the main axis here is the vertical
        //     // axis because Columns are vertical (the cross axis would be
        //     // horizontal).
        //     //
        //     // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
        //     // action in the IDE, or press "p" in the console), to see the
        //     // wireframe for each widget.
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       Container(
        //         alignment: Alignment.center,
        //         width: 0.5 * MediaQuery.of(context).size.width,
        //         height: 0.5 *
        //             (MediaQuery.of(context).size.height -
        //                 MediaQuery.of(context).padding.top -
        //                 MediaQuery.of(context).padding.bottom),
        //         // height: 0.5 * MediaQuery.of(context).size.height,
        //         // height: 0.25 * View.of(context).physicalSize.height,
        //         child: FadeInImage.memoryNetwork(
        //             fit: BoxFit.cover,
        //             placeholder: kTransparentImage,
        //             image:
        //                 'https://raw.githubusercontent.com/disenoUDP/assets/main/diseno-abierto/splash.png'),
        //       ),
        //       // FadeInImage.memoryNetwork(
        //       //     fit: BoxFit.contain,
        //       //     placeholder: kTransparentImage,
        //       //     image:
        //       //         'https://raw.githubusercontent.com/disenoUDP/assets/main/diseno-abierto/logo-escuela.png'),
        //       Text('#disenoabiertoudp',
        //           style: Theme.of(context).textTheme.labelMedium),
        //       Text('2023 diciembre 11-15',
        //           style: Theme.of(context).textTheme.labelMedium),
        //       Text('salvador sanfuentes 2221',
        //           style: Theme.of(context).textTheme.labelMedium),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
