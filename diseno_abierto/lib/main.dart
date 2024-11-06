import 'barra_arriba.dart' as barra_arriba;
import 'estilo.dart' as estilo;
import 'inicio.dart' as inicio;
import 'mapa.dart' as plantas;
import 'proyectos.dart' as proyectos;
import 'talleres.dart' as talleres;
import 'nfc.dart' as nfc;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Diseño Abierto UDP';

    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: estilo.colorPrincipal),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // https://api.flutter.dev/flutter/material/DefaultTabController-class.html
    return DefaultTabController(
      initialIndex: 0,
      // 0 es el inicio, 1 es el mapa,
      // 2 son los talleres, 3 son los proyectos
      length: 4,
      child: Scaffold(
        appBar: barra_arriba.barra,
        body: TabBarView(
          children: <Widget>[
            // pos0
            inicio.cajitasBienvenida,
            // pos1
            plantas.selectorMapas,
            // pos2
            talleres.listaTalleres,
            // pos3
            proyectos.listaProyectos,
          ],
        ),
      ),
    );
  }
}
