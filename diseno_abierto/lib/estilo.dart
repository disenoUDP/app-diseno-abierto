import 'package:flutter/material.dart';

// const colorPrincipal = Color.fromRGBO(0, 94, 184, 1);

const colorPrincipal = Color(0xFF1234FF);

// const colorIcono = Color(0xFF005EB8);

const colorIcono = Color(0xFF1234FF);

const colorFondo = Colors.white;

// const sombra = Color.fromARGB(255, 0, 69, 133);

const sombra = Color.fromARGB(255, 14, 40, 192);

// const sombra = Colors.pink;

const colorHeader = Color(0xFF1234FF);

const colorTextoInicio = Color(0xFF1234FF);

const colorTextoPlanta = Color(0xFF1234FF);

const colorLink = Color.fromRGBO(255, 130, 0, 1);

const estiloLink = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
    color: colorLink);

const estiloTextoInicio = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    color: colorTextoInicio);

const estiloTextoPlanta = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
    color: colorTextoPlanta);

const estiloHeader = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
    color: colorHeader);

const estiloTextoCargando =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'Poppins');

BoxDecoration decoracionInicio = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: colorPrincipal),
    boxShadow: const [
      BoxShadow(
        color: sombra,
        blurRadius: 3,
        offset: Offset(4, 8), // Shadow position
      ),
    ]);
