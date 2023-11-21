import 'estilo.dart' as estilo;
import 'proyecto.dart' as proyecto;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final listaProyectos = FutureBuilder<List<proyecto.Proyecto>>(
  future: proyecto.fetchProyectos(http.Client()),
  builder: (context, snapshot) {
    if (snapshot.hasError) {
      return const Center(
        child: Text(
          'cargando info...!',
          style: estilo.estiloTextoCargando,
        ),
      );
    } else if (snapshot.hasData) {
      return proyecto.ProyectosList(proyectos: snapshot.data!);
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  },
);
