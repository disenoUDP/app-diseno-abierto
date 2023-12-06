import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'estilo.dart' as estilo;

const definicionDisenoAbiertoParte1 =
    "Diseño abierto es una muestra semestral de todos los proyectos de taller en ";

const definicionDisenoAbiertoParte2 = "Diseño UDP";

const definicionApp =
    "Esta app fue creada para navegar la muestra y construir un registro histórico del evento";

const creditosAppParte1 = "Desarrollada por ";

const creditosAppParte2 = "@janisepulveda ";

const creditosAppParte3 = "y ";

const creditosAppParte4 = "@montoyamoraga ";

const creditosAppParte5 = "con fondos de VRA UDP";

const materialesAppParte1 = "construida con ";

const materialesAppParte2 = "Flutter ";

const materialesAppParte3 = "y ";

const materialesAppParte4 = "Material Design 3";

const materialesAppParte5 = " en ";

const materialesAppParte6 = "Santiago de Chile";

const materialesAppParte7 = " en el 2023";

final cajitasBienvenida = Column(
  children: [
    // definicion diseno abierto
    const Spacer(),
    Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(15.0),
      height: 80,
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
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(15.0),
      height: 80,
      decoration: estilo.decoracionInicio,
      child: const Text(
        definicionApp,
        style: estilo.estiloTextoInicio,
      ),
    ),

    // creditos app
    const Spacer(),
    Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(15.0),
      height: 80,
      decoration: estilo.decoracionInicio,
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            const TextSpan(
                text: creditosAppParte1, style: estilo.estiloTextoInicio),
            TextSpan(
                text: creditosAppParte2,
                style: estilo.estiloLink,
                recognizer: TapGestureRecognizer()
                  ..onTap = () =>
                      launchUrl(Uri.parse('https://github.com/janisepulveda'))),
            const TextSpan(
                text: creditosAppParte3, style: estilo.estiloTextoInicio),
            TextSpan(
                text: creditosAppParte4,
                style: estilo.estiloLink,
                recognizer: TapGestureRecognizer()
                  ..onTap = () =>
                      launchUrl(Uri.parse('https://github.com/montoyamoraga'))),
            const TextSpan(
                text: creditosAppParte5, style: estilo.estiloTextoInicio),
          ],
        ),
      ),
    ),

    // materiales app
    const Spacer(),
    Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(15.0),
      height: 80,
      decoration: estilo.decoracionInicio,
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            const TextSpan(
                text: materialesAppParte1, style: estilo.estiloTextoInicio),
            TextSpan(
                text: materialesAppParte2,
                style: estilo.estiloLink,
                recognizer: TapGestureRecognizer()
                  ..onTap = () => launchUrl(Uri.parse('https://flutter.dev'))),
            const TextSpan(
                text: materialesAppParte3, style: estilo.estiloTextoInicio),
            TextSpan(
                text: materialesAppParte4,
                style: estilo.estiloLink,
                recognizer: TapGestureRecognizer()
                  ..onTap =
                      () => launchUrl(Uri.parse('https://m3.material.io'))),
            const TextSpan(
                text: materialesAppParte5, style: estilo.estiloTextoInicio),
            TextSpan(
                text: materialesAppParte6,
                style: estilo.estiloLink,
                recognizer: TapGestureRecognizer()
                  ..onTap = () => launchUrl(Uri.parse(
                      'https://es.wikipedia.org/wiki/Santiago_de_Chile'))),
            const TextSpan(
                text: materialesAppParte7, style: estilo.estiloTextoInicio),
          ],
        ),
      ),
    ),
    const Spacer(),
  ],
);
