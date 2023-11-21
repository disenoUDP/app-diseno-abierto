import 'package:flutter/material.dart';

const colorPrincipal = Color.fromRGBO(0, 94, 184, 1);

const colorIcono = Color(0xFF005EB8);

const colorFondo = Colors.white;

const sombra = Colors.pink;

const colorHeader = Color(0xFF005EB8);
const colorSubheader = Color(0xFF005EB8);

const estiloTextoInicio = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    color: colorSubheader);

const estiloHeader = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
    color: colorHeader);

BoxDecoration decoracionInicio = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: colorSubheader),
    boxShadow: const [
      BoxShadow(
        color: sombra,
        blurRadius: 3,
        offset: Offset(4, 8), // Shadow position
      ),
    ]);
