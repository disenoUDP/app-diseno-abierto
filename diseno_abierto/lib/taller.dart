import 'package:diseno_abierto/estilo.dart';
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
  final String tema;
  final String descripcion;
  final String url;
  final String thumbnailUrl;

  const Taller(
      {required this.sigla,
      required this.nombre,
      required this.docentePrincipal,
      required this.docenteAuxiliar,
      required this.ayudante,
      required this.nivel,
      required this.tema,
      required this.descripcion,
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
      tema: json['tema'] as String,
      descripcion: json['descripcion'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

class TextoTaller extends StatefulWidget {
  const TextoTaller({super.key, required this.texto, required this.estilo});

  final String texto;
  final TextStyle estilo;

  @override
  State<TextoTaller> createState() => _TextoTallerState();
}

class _TextoTallerState extends State<TextoTaller> {
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

class TalleresList extends StatefulWidget {
  const TalleresList({super.key, required this.talleres});

  final List<Taller> talleres;

  @override
  State<TalleresList> createState() => _TalleresListState();
}

class _TalleresListState extends State<TalleresList> {
  get talleres => widget.talleres;

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
      itemCount: widget.talleres.length,
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
                        TextoTaller(
                            texto: talleres[index].sigla,
                            estilo: estiloTallerSigla),
                        const Spacer(),
                        TextoTaller(
                            texto: talleres[index].nombre,
                            estilo: estiloTallerNombre),
                        const Spacer(),
                        TextoTaller(
                            texto: talleres[index].docentePrincipal,
                            estilo: estiloTallerDocente),
                        const Spacer(),
                        TextoTaller(
                            texto: talleres[index].docenteAuxiliar,
                            estilo: estiloTallerDocente),
                        const Spacer(),
                        TextoTaller(
                            texto: talleres[index].tema,
                            estilo: estiloTallerTema),
                        const Spacer(),
                        const Spacer(),
                      ],
                      if (presionado == 1) ...[
                        const Spacer(),
                        TextoTaller(
                            texto: talleres[index].sigla,
                            estilo: estiloTallerSigla),
                        const Spacer(),
                        TextoTaller(
                            texto: talleres[index].nombre,
                            estilo: estiloTallerNombre),
                        const Spacer(),
                        TextoTaller(
                            texto: talleres[index].descripcion,
                            estilo: estiloTallerDescripcion),
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
List<Taller> parseTalleres(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed.map<Taller>((json) => Taller.fromJson(json)).toList();
}

Future<List<Taller>> fetchTalleres(http.Client client) async {
  final response = await client.get(Uri.parse(archivos.talleresJSON));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    return compute(parseTalleres, response.body);
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('No pudimos cargar talleres');
  }
}
