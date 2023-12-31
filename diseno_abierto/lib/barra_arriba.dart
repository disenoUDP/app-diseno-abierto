import 'estilo.dart' as estilo;
import 'package:flutter/material.dart';
// import 'archivos.dart' as archivos;
// import 'package:transparent_image/transparent_image.dart';

final barra = AppBar(
  // leading: Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: FadeInImage.memoryNetwork(
  //         fit: BoxFit.contain,
  //         placeholder: kTransparentImage,
  //         image: archivos.logoDisenoAbierto)),
  centerTitle: true,
  title: const Text(
    '#disenoabiertoudp',
    style: estilo.estiloHeader,
  ),
  backgroundColor: estilo.colorFondo,
  bottom: const TabBar(tabs: <Widget>[
    Tab(
      icon: Icon(Icons.home_outlined, color: estilo.colorIcono),
      text: 'Inicio',
    ),
    Tab(
      icon: Icon(Icons.room_outlined, color: estilo.colorIcono),
      text: 'Mapa',
    ),
    Tab(
      icon: Icon(Icons.auto_awesome_outlined, color: estilo.colorIcono),
      text: 'Talleres',
    ),
    Tab(
      icon: Icon(Icons.auto_awesome_motion_outlined, color: estilo.colorIcono),
      text: 'Proyectos',
    ),
  ]),
);
