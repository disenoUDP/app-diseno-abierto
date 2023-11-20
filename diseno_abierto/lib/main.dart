import 'dart:async';
import 'dart:convert';
// import 'dart:ffi';
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
        // return Image.network(
        //   talleres[index].thumbnailUrl,
        //
        // referencia
        // https://gallery.flutter.dev/#/demo/card

        return InkWell(
          child: Card(
              child: Column(
            children: [
              Image.network(talleres[index].thumbnailUrl),
              Text(talleres[index].sigla),
              Text(talleres[index].nombre,
                  style: Theme.of(context).textTheme.labelSmall),
            ],
          )),
        );

        // return Card(
        //     child: Image.network(
        //   talleres[index].thumbnailUrl,
        // ));
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
            seedColor: const Color.fromRGBO(0, 94, 184, 1)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: appTitle),
    );
  }
}

/*

enum CardType {
  standard,
  tappable,
  selectable,
}

class TravelDestination {
  const TravelDestination({
    required this.assetName,
    required this.assetPackage,
    required this.title,
    required this.description,
    required this.city,
    required this.location,
    this.cardType = CardType.standard,
  });

  final String assetName;
  final String assetPackage;
  final String title;
  final String description;
  final String city;
  final String location;
  final CardType cardType;
}

List<TravelDestination> destinations(BuildContext context) {
  final localizations = GalleryLocalizations.of(context)!;

  return [
    TravelDestination(
      assetName: 'places/india_thanjavur_market.png',
      assetPackage: _kGalleryAssetsPackage,
      title: localizations.cardsDemoTravelDestinationTitle1,
      description: localizations.cardsDemoTravelDestinationDescription1,
      city: localizations.cardsDemoTravelDestinationCity1,
      location: localizations.cardsDemoTravelDestinationLocation1,
    ),
    TravelDestination(
      assetName: 'places/india_chettinad_silk_maker.png',
      assetPackage: _kGalleryAssetsPackage,
      title: localizations.cardsDemoTravelDestinationTitle2,
      description: localizations.cardsDemoTravelDestinationDescription2,
      city: localizations.cardsDemoTravelDestinationCity2,
      location: localizations.cardsDemoTravelDestinationLocation2,
      cardType: CardType.tappable,
    ),
    TravelDestination(
      assetName: 'places/india_tanjore_thanjavur_temple.png',
      assetPackage: _kGalleryAssetsPackage,
      title: localizations.cardsDemoTravelDestinationTitle3,
      description: localizations.cardsDemoTravelDestinationDescription3,
      city: localizations.cardsDemoTravelDestinationCity1,
      location: localizations.cardsDemoTravelDestinationLocation1,
      cardType: CardType.selectable,
    ),
  ];
}

class TravelDestinationItem extends StatelessWidget {
  const TravelDestinationItem(
      {super.key, required this.destination, this.shape});

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 360.0;
  final TravelDestination destination;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SectionTitle(
                title: GalleryLocalizations.of(context)!
                    .settingsTextScalingNormal),
            SizedBox(
              height: height,
              child: Card(
                // This ensures that the Card's children are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: Semantics(
                  label: destination.title,
                  child: TravelDestinationContent(destination: destination),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TappableTravelDestinationItem extends StatelessWidget {
  const TappableTravelDestinationItem({
    super.key,
    required this.destination,
    this.shape,
  });

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 298.0;
  final TravelDestination destination;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SectionTitle(
                title: GalleryLocalizations.of(context)!.cardsDemoTappable),
            SizedBox(
              height: height,
              child: Card(
                // This ensures that the Card's children (including the ink splash) are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: InkWell(
                  onTap: () {},
                  // Generally, material cards use onSurface with 12% opacity for the pressed state.
                  splashColor:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                  // Generally, material cards do not have a highlight overlay.
                  highlightColor: Colors.transparent,
                  child: Semantics(
                    label: destination.title,
                    child: TravelDestinationContent(destination: destination),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectableTravelDestinationItem extends StatelessWidget {
  const SelectableTravelDestinationItem({
    super.key,
    required this.destination,
    required this.isSelected,
    required this.onSelected,
    this.shape,
  });

  final TravelDestination destination;
  final ShapeBorder? shape;
  final bool isSelected;
  final VoidCallback onSelected;

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 298.0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final String selectedStatus = isSelected
        ? GalleryLocalizations.of(context)!.selected
        : GalleryLocalizations.of(context)!.notSelected;

    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SectionTitle(title: GalleryLocalizations.of(context)!.selectable),
            SizedBox(
              height: height,
              child: Card(
                // This ensures that the Card's children (including the ink splash) are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: InkWell(
                  onLongPress: () {
                    onSelected();
                  },
                  // Generally, material cards use onSurface with 12% opacity for the pressed state.
                  splashColor: colorScheme.onSurface.withOpacity(0.12),
                  // Generally, material cards do not have a highlight overlay.
                  highlightColor: Colors.transparent,
                  child: Stack(
                    children: [
                      Container(
                        color: isSelected
                            // Generally, material cards use primary with 8% opacity for the selected state.
                            // See: https://material.io/design/interaction/states.html#anatomy
                            ? colorScheme.primary.withOpacity(0.08)
                            : Colors.transparent,
                      ),
                      Semantics(
                        label: '${destination.title}, $selectedStatus',
                        onLongPressHint: isSelected
                            ? GalleryLocalizations.of(context)!.deselect
                            : GalleryLocalizations.of(context)!.select,
                        child:
                            TravelDestinationContent(destination: destination),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.check_circle,
                            color: isSelected
                                ? colorScheme.primary
                                : Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}

class TravelDestinationContent extends StatelessWidget {
  const TravelDestinationContent({super.key, required this.destination});

  final TravelDestination destination;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.headlineSmall!.copyWith(
      color: Colors.white,
    );
    final descriptionStyle = theme.textTheme.titleMedium!;
    final localizations = GalleryLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 184,
          child: Stack(
            children: [
              Positioned.fill(
                // In order to have the ink splash appear above the image, you
                // must use Ink.image. This allows the image to be painted as
                // part of the Material and display ink effects above it. Using
                // a standard Image will obscure the ink splash.
                child: Ink.image(
                  image: AssetImage(
                    destination.assetName,
                    package: destination.assetPackage,
                  ),
                  fit: BoxFit.cover,
                  child: Container(),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Semantics(
                    container: true,
                    header: true,
                    child: Text(
                      destination.title,
                      style: titleStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Description and share/explore buttons.
        Semantics(
          container: true,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: DefaultTextStyle(
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: descriptionStyle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // This array contains the three line description on each card
                  // demo.
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      destination.description,
                      style: descriptionStyle.copyWith(color: Colors.black54),
                    ),
                  ),
                  Text(destination.city),
                  Text(destination.location),
                ],
              ),
            ),
          ),
        ),
        if (destination.cardType == CardType.standard)
          // share, explore buttons
          Padding(
            padding: const EdgeInsets.all(8),
            child: OverflowBar(
              alignment: MainAxisAlignment.start,
              spacing: 8,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(localizations.demoMenuShare,
                      semanticsLabel: localizations
                          .cardsDemoShareSemantics(destination.title)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(localizations.cardsDemoExplore,
                      semanticsLabel: localizations
                          .cardsDemoExploreSemantics(destination.title)),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class CardsDemo extends StatefulWidget {
  const CardsDemo({super.key});

  @override
  State<CardsDemo> createState() => _CardsDemoState();
}

class _CardsDemoState extends State<CardsDemo> with RestorationMixin {
  final RestorableBool _isSelected = RestorableBool(false);

  @override
  String get restorationId => 'cards_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_isSelected, 'is_selected');
  }

  @override
  void dispose() {
    _isSelected.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(GalleryLocalizations.of(context)!.demoCardTitle),
      ),
      body: Scrollbar(
        child: ListView(
          restorationId: 'cards_demo_list_view',
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          children: [
            for (final destination in destinations(context))
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: (destination.cardType == CardType.standard)
                    ? TravelDestinationItem(destination: destination)
                    : destination.cardType == CardType.tappable
                        ? TappableTravelDestinationItem(
                            destination: destination)
                        : SelectableTravelDestinationItem(
                            destination: destination,
                            isSelected: _isSelected.value,
                            onSelected: () {
                              setState(() {
                                _isSelected.value = !_isSelected.value;
                              });
                            },
                          ),
              ),
          ],
        ),
      ),
    );
  }
}


*/

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
    const colorIcon = Color(0xFF005EB8);
    const colorHeader = Color(0xFF005EB8);
    const colorSubheader = Color(0xFF005EB8);

    const espacioEntreTextoInicio = 20;
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
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                color: colorHeader),
          ),
          backgroundColor: Colors.white,
          bottom: const TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home_outlined, color: colorIcon),
              text: 'Inicio',
            ),
            Tab(
              icon: Icon(Icons.room_outlined, color: colorIcon),
              text: 'Mapa',
            ),
            Tab(
                icon: Icon(Icons.auto_awesome_outlined, color: colorIcon),
                text: 'Talleres'),
            Tab(
                icon:
                    Icon(Icons.auto_awesome_motion_outlined, color: colorIcon),
                text: 'Proyectos'),
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            // pos0
            const Column(
              children: [
                Spacer(),
                Text(
                  'diseño abierto es una muestra semestral de los resultados de taller por los estudiantes de la Escuela de Diseño UDP.',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      color: colorSubheader),
                ),
                Spacer(),
                Text(
                  'la app se actualizará cada semestre, con el objetivo de tener un registro de la historia de los trabajos de taller.',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      color: colorSubheader),
                ),
                Spacer(),
                Text(
                  'esta app está siendo desarrollada por @janisepulveda, estudiante de diseño UDP, y @montoyamoraga, profesore asistente de diseño UDP.',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      color: colorSubheader),
                ),
                Spacer(),
                Text(
                  'esta es la versión 0.0.1. desarrollada en Flutter con el sistema de diseño Material Design 3 de Google, con el apoyo de fondos de Vicerrectoría académica UDP.',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      color: colorSubheader),
                ),
                Spacer(),
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
                                          color: colorSubheader),
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
                                          color: colorSubheader),
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
            FutureBuilder<List<Taller>>(
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
                  // return const Text("bla");
                  return Stack(
                    children: [
                      TalleresList(talleres: snapshot.data!),
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
            FutureBuilder<List<Taller>>(
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
