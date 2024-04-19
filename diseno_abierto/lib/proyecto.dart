import 'package:diseno_abierto/estilo.dart';
import 'package:http/http.dart' as http;
import 'archivos.dart' as archivos;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:transparent_image/transparent_image.dart';

class Proyecto {
  final String sigla;
  final String nombre;
  List<String> estudiantes;
  final String texto;
  List<String> etiquetas;
  // final String url;
  // final String thumbnailUrl;

  Proyecto({
    required this.sigla,
    required this.nombre,
    required this.estudiantes,
    required this.texto,
    required this.etiquetas,
    // required this.url,
    // required this.thumbnailUrl
  });

  factory Proyecto.fromJson(Map<String, dynamic> json) {
    return Proyecto(
      sigla: json['sigla'] as String,
      nombre: json['nombre'] as String,
      estudiantes:
          (json['estudiantes'] as List).map((e) => e as String).toList(),
      texto: json['texto'] as String,
      etiquetas: (json['etiquetas'] as List).map((e) => e as String).toList(),
      // url: json['url'] as String,
      // thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

class TextoProyecto extends StatefulWidget {
  const TextoProyecto({super.key, required this.texto, required this.estilo});

  final String texto;
  final TextStyle estilo;

  @override
  State<TextoProyecto> createState() => _TextoProyectoState();
}

class _TextoProyectoState extends State<TextoProyecto> {
  get texto => widget.texto;
  get estilo => widget.estilo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Text(
        texto,
        softWrap: true,
        style: estilo,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ProyectosList extends StatefulWidget {
  const ProyectosList({super.key, required this.proyectos});

  final List<Proyecto> proyectos;

  @override
  State<ProyectosList> createState() => _ProyectosListState();
}

class _ProyectosListState extends State<ProyectosList> {
  get proyectos => widget.proyectos;

  var presionado = 0;

  void botonPresionado() {
    setState(() {
      presionado = presionado + 1;
      presionado = presionado % 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
      ),
      itemCount: widget.proyectos.length,
      itemBuilder: (context, index) {
        // referencia
        // https://gallery.flutter.dev/#/demo/card
        return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child: Card(
                    child: InkWell(
              onTap: botonPresionado,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: null,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (presionado == 0) ...[
                        const Spacer(),
                        const Spacer(),
                        TextoProyecto(
                            texto: proyectos[index].sigla,
                            estilo: estiloProyectoSigla),
                        const Spacer(),
                        TextoProyecto(
                            texto: proyectos[index].nombre,
                            estilo: estiloProyectoNombre),
                        const Spacer(),
                        for (var estudiante in proyectos[index].estudiantes)
                          TextoProyecto(
                              texto: estudiante,
                              estilo: estiloProyectoEstudiantes),
                        const Spacer(),
                        for (var etiqueta in proyectos[index].etiquetas)
                          TextoProyecto(
                              texto: '#$etiqueta',
                              estilo: estiloProyectoEstudiantes),
                        const Spacer(),
                        const Spacer(),
                      ],
                      if (presionado == 1) ...[
                        const Spacer(),
                        const Spacer(),
                        TextoProyecto(
                            texto: proyectos[index].sigla,
                            estilo: estiloProyectoSigla),
                        const Spacer(),
                        TextoProyecto(
                            texto: proyectos[index].nombre,
                            estilo: estiloProyectoNombre),
                        const Spacer(),
                        TextoProyecto(
                            texto: proyectos[index].texto,
                            estilo: estiloProyectoTexto),
                        const Spacer(),
                        const Spacer(),
                      ],
                    ],
                  )),
            ))));
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
    return compute(parseProyectos, response.body);
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('No pudimos cargar proyectos');
  }
}
