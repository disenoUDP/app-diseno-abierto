import 'estilo.dart' as estilo;
import 'package:flutter/material.dart';

final barra = AppBar(
  centerTitle: true,
  title: const Text(
    '#disenoabiertoudp',
    style: estilo.estiloHeader,
  ),
  backgroundColor: estilo.colorFondo,
  bottom: const TabBar(tabs: <Widget>[
    Tab(
      icon: Icon(Icons.home_outlined, color: estilo.colorIcono),
      text: 'inicio',
    ),
    Tab(
      icon: Icon(Icons.room_outlined, color: estilo.colorIcono),
      text: 'mapa',
    ),
    Tab(
        icon: Icon(Icons.auto_awesome_outlined, color: estilo.colorIcono),
        text: 'talleres'),
    Tab(
        icon:
            Icon(Icons.auto_awesome_motion_outlined, color: estilo.colorIcono),
        text: 'proyectos'),
  ]),
);
