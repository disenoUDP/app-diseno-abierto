import 'package:flutter/material.dart';

const colorPrincipal = Color(0xFF0000FF);

const colorIcono = Color(0xFF1234FF);

const colorFondo = Colors.white;

const sombra = Color.fromARGB(255, 14, 40, 192);

const colorHeader = Color(0xFF1234FF);

const colorTextoInicio = Color(0xFF1234FF);

const colorTextoPlanta = Color(0xFF1234FF);

const colorLink = Color(0xFF0000FF);

const estiloMapaOpcion = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: 'Poppins',
    color: colorLink);

const estiloLink = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
    color: colorLink);

const estiloTextoInicio = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontFamily: 'Poppins',
    color: colorTextoInicio);

const estiloTextoMenuChip = TextStyle(
    fontSize: 14,
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

const estiloTallerSigla = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    color: colorHeader);

const estiloTallerNombre = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    color: colorHeader);

const estiloTallerDocente = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    color: colorHeader);

const estiloTallerTema = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontFamily: 'Poppins',
    color: colorHeader);

const estiloTallerDescripcion = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    fontFamily: 'Poppins',
    color: colorHeader);

const estiloProyectoSigla = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    color: colorHeader);

const estiloProyectoEstudiantes = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    color: colorHeader);

const estiloProyectoNombre = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    color: colorHeader);

const estiloProyectoTexto = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
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
