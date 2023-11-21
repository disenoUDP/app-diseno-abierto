// import 'archivos.dart' as archivos;
import 'barra_arriba.dart' as barra_arriba;
import 'estilo.dart' as estilo;
import 'inicio.dart' as inicio;
import 'plantas.dart' as plantas;
import 'taller.dart' as taller;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:transparent_image/transparent_image.dart';
// import 'package:url_launcher/url_launcher.dart';

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
    // https://api.flutter.dev/flutter/material/DefaultTabController-class.html
    return DefaultTabController(
      initialIndex: 0,
      // 0 es el inicio, 1 es el mapa, 2 son los talleres, 3 son los proyectos
      length: 4,
      child: Scaffold(
        appBar: barra_arriba.barra,
        body: TabBarView(
          children: <Widget>[
            inicio.cajitasBienvenida,
            plantas.selectorMapas,
            // pos2
            FutureBuilder<List<taller.Taller>>(
              future: taller.fetchTalleres(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      'cargando info...!',
                      style: estilo.estiloTextoCargando,
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
              future: taller.fetchTalleres(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      'cargando info...!',
                      style: estilo.estiloTextoCargando,
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
