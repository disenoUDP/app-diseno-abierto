import 'estilo.dart' as estilo;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const definicionDisenoAbierto =
    "diseño abierto es una muestra semestral de los resultados de taller por los estudiantes de la Escuela de Diseño UDP.";

const definicionApp =
    "la app se actualizará cada semestre, con el objetivo de tener un registro de la historia de los trabajos de taller.";

const creditosApp =
    "esta app está siendo desarrollada por @janisepulveda, estudiante de diseño UDP, y @montoyamoraga, profesore asistente de diseño UDP.";

const materialesApp =
    "esta es la versión 0.0.1. desarrollada en Flutter con el sistema de diseño Material Design 3 de Google, con el apoyo de fondos de Vicerrectoría académica UDP.";

final cajitasBienvenida = Column(
  children: [
    const Spacer(),
    Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: estilo.decoracionInicio,
      child: InkWell(
        onTap: () => launchUrl(Uri.parse(
            'https://www.instagram.com/explore/tags/disenoabiertoudp/')),
        child: const Text(
          definicionDisenoAbierto,
          style: estilo.estiloTextoInicio,
        ),
      ),
      // const Text(
      //   'diseño abierto es una muestra semestral de los resultados de taller por los estudiantes de la Escuela de Diseño UDP.',
      //   style: TextStyle(
      //       fontSize: 16,
      //       fontWeight: FontWeight.w500,
      //       fontFamily: 'Poppins',
      //       color: colorSubheader),
      // ),
    ),
    const Spacer(),
    Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: estilo.decoracionInicio,
      child: const Text(
        definicionApp,
        style: estilo.estiloTextoInicio,
      ),
    ),
    const Spacer(),
    Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: estilo.decoracionInicio,
      child: const Text(
        creditosApp,
        style: estilo.estiloTextoInicio,
      ),
    ),
    const Spacer(),
    Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: estilo.decoracionInicio,
      child: const Text(
        materialesApp,
        style: estilo.estiloTextoInicio,
      ),
    ),
    const Spacer(),
  ],
);
