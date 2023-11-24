import 'estilo.dart' as estilo;
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// const definicionDisenoAbiertoParte1 =
//     TextSpan (text: "diseño abierto es una muestra semestral de todos los proyectos de taller en ", style: TextStyle(fontWeight: FontWeight.w500));
    

// const definicionDisenoAbiertoParte2 =
//     TextSpan(text: "diseño udp", style: TextStyle(fontWeight: FontWeight.bold));


const definicionDisenoAbiertoParte1 = "diseño abierto es una muestra semestral de todos los proyectos de taller en ";

const definicionDisenoAbiertoParte2 = "diseño udp";

const definicionApp =
    "esta app fue creada para navegar la muestra y construir un registro histórico del evento";

const creditosApp =
    "escrita por @janisepulveda y @montoyamoraga con fondos de vra udp";

const materialesApp =
    "v0.0.1. hecha con flutter y material design 3, en santiago de chile, 2023";

final cajitasBienvenida = Column(
  children: [
    const Spacer(),
    Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: estilo.decoracionInicio,
      // child: InkWell(
        // onTap: () => launchUrl(Uri.parse(
        //     'https://www.instagram.com/explore/tags/disenoabiertoudp/')),
            child:
            RichText(
              text: const TextSpan(
                text: "diseño udp", style: TextStyle(fontWeight: FontWeight.bold),
                 children: <TextSpan>[
                  TextSpan(text: 'diseño abierto es una muestra semestral de todos los proyectos de taller en ', style: estilo.estiloTextoInicio),
                  TextSpan(text: 'diseño udp', style: estilo.estiloLink),
                 ],
            ),),
      // ),
        // child:  Text(
        //   definicionDisenoAbiertoParte1 + definicionDisenoAbiertoParte2,
        //   style: estilo.estiloTextoInicio,
        // ),
      ),
      // const Text(
      //   'diseño abierto es una muestra semestral de los resultados de taller por los estudiantes de la Escuela de Diseño UDP.',
      //   style: TextStyle(
      //       fontSize: 16,
      //       fontWeight: FontWeight.w500,
      //       fontFamily: 'Poppins',
      //       color: colorSubheader),
      // ),

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
