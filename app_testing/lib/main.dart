import 'dart:convert';
import 'package:app_testing/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<void> main() async {

  // lee el JSON
  String jsonString = await rootBundle.loadString('assets/talleres.json');

  // decodifica el JSON
  Map<String, dynamic> data = json.decode(jsonString);

  // accede al nombre del primer taller 
  List<dynamic> talleres = data['talleres'];
  String nombre = talleres[0]['nombre'];

  // muestra el nombre del taller
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Leer JSON desde assets'),
      ),
      body: Center(
        child: Text('El nombre es: $nombre'),
      ),
    ),
  ));
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(fontFamily: 'Popppins', useMaterial3: true),
      home: const HomePage()
    );
  }
}
