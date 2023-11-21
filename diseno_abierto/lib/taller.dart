import 'package:http/http.dart' as http;
import 'archivos.dart' as archivos;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

// A function that converts a response body into a List<Taller>.
List<Taller> parseTalleres(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed.map<Taller>((json) => Taller.fromJson(json)).toList();
}

Future<List<Taller>> fetchTalleres(http.Client client) async {
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
