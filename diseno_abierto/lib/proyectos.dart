import 'estilo.dart' as estilo;
import 'proyecto.dart' as proyecto;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum Filtro { primero, grafico, industrial, sistemaModa, integradoVertical }

var mapeo = {
  'primero': 'Primer año',
  'grafico': 'Gráfico',
  'industrial': 'Industrial',
  'sistemaModa': 'Sistema moda',
  'integradoVertical': 'Integrado vertical',
};

class _MenuFilterChipState extends State<MenuFilterChip> {
  Set<Filtro> filters = <Filtro>{};

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 5.0,
          children: Filtro.values.map((Filtro valor) {
            return FilterChip(
              label: Text(mapeo[valor.name.toString()]!,
                  style: estilo.estiloTextoMenuChip),
              selected: filters.contains(valor),
              onSelected: (bool selected) {
                setState(() {
                  if (selected) {
                    filters.add(valor);
                  } else {
                    filters.remove(valor);
                  }
                });
              },
            );
          }).toList(),
        ));
  }
}

class MenuFilterChip extends StatefulWidget {
  const MenuFilterChip({super.key});

  @override
  State<MenuFilterChip> createState() => _MenuFilterChipState();
}

final listaProyectos = FutureBuilder<List<proyecto.Proyecto>>(
  future: proyecto.fetchProyectos(http.Client()),
  builder: (context, snapshot) {
    if (snapshot.hasError) {
      return const Center(
        child: Text(
          'Cargando info...!',
          style: estilo.estiloTextoCargando,
        ),
      );
    } else if (snapshot.hasData) {
      return
          // Align(
          //     alignment: Alignment.topCenter,
          //     child: Wrap(
          //       direction: Axis.horizontal,
          //       alignment: WrapAlignment.center,
          //       children: [
          // const MenuFilterChip(),
          // Text(
          //   'Próximamente',
          //   maxLines: 2,
          //   style: estilo.estiloHeader,
          //   textAlign: TextAlign.center,
          // ),
          proyecto.ProyectosList(proyectos: snapshot.data!);

      // ],
      // ));

      // return proyecto.ProyectosList(proyectos: snapshot.data!);
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  },
);
