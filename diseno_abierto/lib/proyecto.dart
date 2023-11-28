import 'package:http/http.dart' as http;
import 'archivos.dart' as archivos;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Proyecto {
  final String sigla;
  final String nombre;
  final String estudiante;
  final String texto;
  final String url;
  final String thumbnailUrl;

  const Proyecto(
      {required this.sigla,
      required this.nombre,
      required this.estudiante,
      required this.texto,
      required this.url,
      required this.thumbnailUrl});

  factory Proyecto.fromJson(Map<String, dynamic> json) {
    return Proyecto(
      sigla: json['sigla'] as String,
      nombre: json['nombre'] as String,
      estudiante: json['estudiante'] as String,
      texto: json['texto'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

class ProyectosList extends StatelessWidget {
  const ProyectosList({super.key, required this.proyectos});

  final List<Proyecto> proyectos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: proyectos.length,
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
              FadeInImage.memoryNetwork(
                  fit: BoxFit.contain,
                  placeholder: kTransparentImage,
                  image: proyectos[index].thumbnailUrl),
              Text(proyectos[index].sigla),
              Text(proyectos[index].nombre,
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
List<Proyecto> parseProyectos(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed.map<Proyecto>((json) => Proyecto.fromJson(json)).toList();
}

Future<List<Proyecto>> fetchProyectos(http.Client client) async {
  final response = await client.get(Uri.parse(archivos.proyectosJSON));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    //return Taller.fromJson(jsonDecode(response.body));
    return compute(parseProyectos, response.body);
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('No pudimos cargar talleres');
  }
}
