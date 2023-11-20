import 'dart:async';
import 'dart:convert';
// import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';

Future<String> loadAsset() async {
  // return rootBundle.loadString('assets/talleres.json');
  return rootBundle.loadString('assets/photos.json');
}

Future<List<Taller>> fetchTalleres(http.Client client) async {
  final response = await client.get(Uri.parse(
      'https://raw.githubusercontent.com/janisepulveda/app-diseno-abierto/main/mapa_diseno_abierto/assets/photos.json'));
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

class Taller {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Taller(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

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
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: 0.5 * MediaQuery.of(context).size.width,
              height: 0.5 *
                  (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom),
              // height: 0.5 * MediaQuery.of(context).size.height,
              // height: 0.25 * View.of(context).physicalSize.height,
              child: FadeInImage.memoryNetwork(
                  fit: BoxFit.cover,
                  placeholder: kTransparentImage,
                  image:
                      'https://raw.githubusercontent.com/disenoUDP/assets/main/diseno-abierto/splash.png'),
            ),
            // FadeInImage.memoryNetwork(
            //     fit: BoxFit.contain,
            //     placeholder: kTransparentImage,
            //     image:
            //         'https://raw.githubusercontent.com/disenoUDP/assets/main/diseno-abierto/logo-escuela.png'),
            Text('#disenoabiertoudp',
                style: Theme.of(context).textTheme.labelMedium),
            Text('2023 diciembre 11-15',
                style: Theme.of(context).textTheme.labelMedium),
            Text('salvador sanfuentes 2221',
                style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}
