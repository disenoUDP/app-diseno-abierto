// import 'package:diseno_abierto/estilo.dart';
// import 'package:http/http.dart' as http;
// import 'archivos.dart' as archivos;
// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class Taller {
//   final String sigla;
//   final String nombre;
//   final String docentePrincipal;
//   final String docenteAuxiliar;
//   final String ayudante;
//   final String nivel;
//   final String tema;
//   final String descripcion;
//   final String url;
//   final String thumbnailUrl;

//   const Taller(
//       {required this.sigla,
//       required this.nombre,
//       required this.docentePrincipal,
//       required this.docenteAuxiliar,
//       required this.ayudante,
//       required this.nivel,
//       required this.tema,
//       required this.descripcion,
//       required this.url,
//       required this.thumbnailUrl});

//   factory Taller.fromJson(Map<String, dynamic> json) {
//     return Taller(
//       sigla: json['sigla'] as String,
//       nombre: json['nombre'] as String,
//       docentePrincipal: json['docentePrincipal'] as String,
//       docenteAuxiliar: json['docenteAuxiliar'] as String,
//       ayudante: json['ayudante'] as String,
//       nivel: json['nivel'] as String,
//       tema: json['tema'] as String,
//       descripcion: json['descripcion'] as String,
//       url: json['url'] as String,
//       thumbnailUrl: json['thumbnailUrl'] as String,
//     );
//   }
// }

// class TextoTaller extends StatefulWidget {
//   const TextoTaller({super.key, required this.texto, required this.estilo});

//   final String texto;
//   final TextStyle estilo;

//   @override
//   State<TextoTaller> createState() => _TextoTallerState();
// }

// class _TextoTallerState extends State<TextoTaller> {
//   get texto => widget.texto;
//   get estilo => widget.estilo;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
//       child: Text(
//         texto,
//         softWrap: true,
//         style: estilo,
//         textAlign: TextAlign.center,
//       ),
//     );
//   }
// }

// class TalleresList extends StatefulWidget {
//   const TalleresList({super.key, required this.talleres});

//   final List<Taller> talleres;

//   @override
//   State<TalleresList> createState() => _TalleresListState();
// }

// bool loading = false;

// //     setState(() {
// //       loading = false;
// //     });
// //     allTodos = json.decode(response.body);

// //     return allTodos;
// //   } catch (error) {
// //     setState(() {
// //       loading = false;
// //     });
// //     throw error;
// //   }
// // }

// class _TalleresListState extends State<TalleresList> {
//   get talleres => widget.talleres;

// // void main() {
// //   runApp(const ExpansionTileControllerApp());
// // }

// // class ExpansionTileControllerApp extends StatefulWidget {
// //   const ExpansionTileControllerApp({super.key});

// //   @override
// //   State<ExpansionTileControllerApp> createState() =>
// //       _ExpansionTileControllerAppState();
// // }

// // class _ExpansionTileControllerAppState
// //     extends State<ExpansionTileControllerApp> {
// //   final ExpansionTileController controller = ExpansionTileController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       theme: ThemeData(useMaterial3: true),
// //       home: Scaffold(
// //         body: Column(
// //           children: <Widget>[
// //             // A controller has been provided to the ExpansionTile because it's
// //             // going to be accessed from a component that is not within the
// //             // tile's BuildContext.
// //             ExpansionTile(
// //               controller: controller,
// //               title: const Text('ExpansionTile with explicit controller.'),
// //               children: <Widget>[
// //                 Container(
// //                   alignment: Alignment.center,
// //                   padding: const EdgeInsets.all(24),
// //                   child: const Text('ExpansionTile Contents'),
// //                 ),
// //               ],
// //             ),
// //             const SizedBox(height: 8),
// //             ElevatedButton(
// //               child: const Text('Expand/Collapse the Tile Above'),
// //               onPressed: () {
// //                 if (controller.isExpanded) {
// //                   controller.collapse();
// //                 } else {
// //                   controller.expand();
// //                 }
// //               },
// //             ),
// //             const SizedBox(height: 48),
// //             // A controller has not been provided to the ExpansionTile because f
// //             // the automatically created one can be retrieved via the tile's BuildContext.
// //             ExpansionTile(
// //               title: const Text('ExpansionTile with implicit controller.'),
// //               children: <Widget>[
// //                 Builder(
// //                   builder: (BuildContext context) {
// //                     return Container(
// //                       padding: const EdgeInsets.all(24),
// //                       alignment: Alignment.center,
// //                       child: ElevatedButton(
// //                         child: const Text('Collapse This Tile'),
// //                         onPressed: () {
// //                           return ExpansionTileController.of(context).collapse();
// //                         },
// //                       ),
// //                     );
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

//   final ExpansionTileController controller = ExpansionTileController();

//   @override
//   Widget build(BuildContext context) {
//     // return FutureBuilder(
//     // builder: (context, snapshot) {
//     // WHILE THE CALL IS BEING MADE AKA LOADING
//     // if (!snapshot.hasData) {
//     //   return const Center(child: Text('Loading'));
//     // }

//     // WHEN THE CALL IS DONE BUT HAPPENS TO HAVE AN ERROR
//     // if (snapshot.hasError) {
//     //   return const Center(child: Text('oh no'));
//     // }

//     // IF IT WORKS IT GOES HERE!
//     // return Container(
//     //   alignment: Alignment.center,
//     //   padding: const EdgeInsets.all(24),
//     //   child: Container(
//     //     alignment: Alignment.center,
//     //     padding: const EdgeInsets.all(24),
//     //     child: const Text('ExpansionTile Contents'),
//     //   ),
//     // );

//     return Center(
//         child: Card(
//             child: InkWell(
//       // onTap: botonPresionado,
//       child: SizedBox(
//           width: 160,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Spacer(),
//               TextoTaller(texto: talleres[0].sigla, estilo: estiloTallerSigla),
//               const Spacer(),
//               TextoTaller(
//                   texto: talleres[0].nombre, estilo: estiloTallerNombre),
//               const Spacer(),
//               TextoTaller(
//                   texto: talleres[0].docentePrincipal,
//                   estilo: estiloTallerDocente),
//               const Spacer(),
//               TextoTaller(
//                   texto: talleres[0].docenteAuxiliar,
//                   estilo: estiloTallerDocente),
//               const Spacer(),
//             ],
//           )),
//     )));
//     ;
//     // },
//     // );

//     // },
//     // );
//   }

//   // ExpansionTile(
//   //   controller: controller,
//   //   title: const Text('ExpansionTile with explicit controller.'),
//   //   children: <Widget>[
//   //     Container(
//   //       alignment: Alignment.center,
//   //       padding: const EdgeInsets.all(24),
//   //       child: const Text('ExpansionTile Contents'),
//   //     ),
//   //   ],
//   // );

//   // return GridView.builder(
//   //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//   //     crossAxisCount: 2,
//   //   ),
//   //   itemCount: widget.talleres.length,
//   //   itemBuilder: (context, index) {
//   //     // referencia
//   //     // https://gallery.flutter.dev/#/demo/card
//   //     return Center(
//   //         child: Card(
//   //             child: InkWell(
//   //       onTap: botonPresionado,
//   //       child: SizedBox(
//   //           width: 160,
//   //           child: Column(
//   //             mainAxisAlignment: MainAxisAlignment.center,
//   //             crossAxisAlignment: CrossAxisAlignment.center,
//   //             children: [
//   //               const Spacer(),
//   //               TextoTaller(
//   //                   texto0: talleres[index].sigla,
//   //                   texto1: 'other',
//   //                   estilo: estiloTallerSigla),
//   //               const Spacer(),
//   //               TextoTaller(
//   //                   texto0: talleres[index].nombre,
//   //                   texto1: 'other',
//   //                   estilo: estiloTallerNombre),
//   //               const Spacer(),
//   //               TextoTaller(
//   //                   texto0: talleres[index].docentePrincipal,
//   //                   texto1: 'other',
//   //                   estilo: estiloTallerDocente),
//   //               const Spacer(),
//   //               TextoTaller(
//   //                   texto0: talleres[index].docenteAuxiliar,
//   //                   texto1: 'other',
//   //                   estilo: estiloTallerDocente),
//   //               const Spacer(),
//   //             ],
//   //           )),
//   //     )));
//   //   },
//   // );
// }

// // A function that converts a response body into a List<Taller>.
// List<Taller> parseTalleres(String responseBody) {
//   final parsed =
//       (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

//   return parsed.map<Taller>((json) => Taller.fromJson(json)).toList();
// }

// Future<List<Taller>> fetchTalleres(http.Client client) async {
//   final response = await client.get(Uri.parse(archivos.talleresJSON));
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response, then parse the JSON.
//     return compute(parseTalleres, response.body);
//   } else {
//     // If the server did not return a 200 OK response, then throw an exception.
//     throw Exception('No pudimos cargar talleres');
//   }
// }
