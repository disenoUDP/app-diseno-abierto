// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testing/models/category_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  //indica que una funcion reemplaza o anula una funcion con el mismo nombre                                
  Widget build(BuildContext context) {
    //proporciona info del contexto en el que se construye el widget
    _getCategories();
    return Scaffold(
      //construye y retorna un widget que contiene toda la app
      appBar: appBar(),
      //define una barra de app en la parte superior con un titulo
      backgroundColor: Colors.white,
      body: Column(
        //tiene el contenido principal de la pantalla
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //define una lista de widgets secundarios, se ponen dentro de una widget contenedor
          // _searchField(),
          const SizedBox(height: 40,),
          //distancia vertical entre los dos widgets
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Categorías',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                height: 150,
                color: Colors.green,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container();
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  //esto rompio la emulacion
  Container _searchField() {
    return Container(
          //parametros barra de busqueda
          margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xff1D1617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0
              )
            ]
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(15),
              hintText: 'Buscar Panqueques',
              hintStyle: const TextStyle(
                color: Color(0xffDDDADA),
                fontSize: 14
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/iconos/Search.svg'),
              ),
              suffixIcon: SizedBox(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const VerticalDivider(
                        color: Colors.black,
                        indent: 10,
                        //crea espacio desde arriba
                        endIndent: 10,
                        //crea espacio desde abajo
                        thickness: 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset('assets/iconos/Filter.svg'),
                      ),
                    ],
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none
              )
            ),
          ),
        );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Desayuno',
        //titulo, encabezado en la app
        style: TextStyle(
          color: Colors.black,
          //color de la tipografia
          fontSize: 18,
          fontWeight: FontWeight.bold
          //tamano y peso visual de la tipografia
        ),
      ),
      backgroundColor: Colors.white,
      //color de fondo
      elevation: 0.0,
      //sombra del encabezado
      centerTitle: true,
      //centrar el encabezado
      leading: GestureDetector(
        onTap: () {
          //interaccion con el titulo, al tacto????

       },
       child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xffF7F8F8),
          borderRadius: BorderRadius.circular(10)
        ),
        child: SvgPicture.asset(
          'assets/iconos/Arrow - Left 2.svg',
          //iconos descargados de github, formato .svg, se descargan y pegan en una carpeta dentro del proyecto
          height: 20,
          width: 20,
        ),
       
       ),
      ),
      actions: [
        GestureDetector(
        onTap:() {
          
        },
        child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        width: 37,
        decoration: BoxDecoration(
          color: const Color(0xffF7F8F8),
          borderRadius: BorderRadius.circular(10)
        ),
        child: SvgPicture.asset(
          'assets/iconos/dots.svg',
          height: 5,
          width: 5,
        ),
              ),
      ),
      ],
    );
  }
}