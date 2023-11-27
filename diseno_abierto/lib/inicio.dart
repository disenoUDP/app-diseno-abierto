import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'estilo.dart' as estilo;
// import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

const definicionDisenoAbiertoParte1 =
    "diseño abierto es una muestra semestral de todos los proyectos de taller en ";

const definicionDisenoAbiertoParte2 = "diseño udp";

const definicionApp =
    "esta app fue creada para navegar la muestra y construir un registro histórico del evento";

const creditosApp =
    "escrita por @janisepulveda y @montoyamoraga con fondos de vra udp";

const materialesApp =
    "v0.0.1. hecha con flutter y material design 3, en santiago de chile, 2023";

final cajitasBienvenida = Column(
  children: [
    // definicion diseno abierto
    const Spacer(),
    Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: estilo.decoracionInicio,
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          children: <TextSpan>[
            const TextSpan(
                text: definicionDisenoAbiertoParte1,
                style: estilo.estiloTextoInicio),
            TextSpan(
                text: definicionDisenoAbiertoParte2,
                style: estilo.estiloLink,
                recognizer: TapGestureRecognizer()
                  ..onTap = () => launchUrl(
                      Uri.parse('https://www.instagram.com/diseno_udp/'))),
          ],
        ),
      ),
    ),

    // definicion app
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

    // creditos app
    const Spacer(),
    Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: estilo.decoracionInicio,
      child: RichText(
        text: const TextSpan(
          // text: "creditos app", style: TextStyle(fontWeight: FontWeight.bold),
          children: <TextSpan>[
            TextSpan(text: 'escrita por ', style: estilo.estiloTextoInicio),
            TextSpan(text: '@janisepulveda ', style: estilo.estiloLink),
            TextSpan(text: 'y ', style: estilo.estiloTextoInicio),
            TextSpan(text: '@montoyamoraga ', style: estilo.estiloLink),
            TextSpan(
                text: 'con fondos de vra udp', style: estilo.estiloTextoInicio),
          ],
        ),
      ),
    ),

    // materiales app
    const Spacer(),
    Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: estilo.decoracionInicio,
      child: RichText(
        text: const TextSpan(
          // text: "materiales app", style: TextStyle(fontWeight: FontWeight.bold),
          children: <TextSpan>[
            TextSpan(
                text: 'v0.0.1 hecha con ', style: estilo.estiloTextoInicio),
            TextSpan(text: 'flutter ', style: estilo.estiloLink),
            TextSpan(text: 'y ', style: estilo.estiloTextoInicio),
            TextSpan(text: 'material design 3 ', style: estilo.estiloLink),
            TextSpan(text: 'en ', style: estilo.estiloTextoInicio),
            TextSpan(text: 'santiago de chile ', style: estilo.estiloLink),
            TextSpan(text: ', 2023', style: estilo.estiloTextoInicio),
          ],
        ),
      ),
    ),

    // ???
    const Spacer(),
  ],
);
