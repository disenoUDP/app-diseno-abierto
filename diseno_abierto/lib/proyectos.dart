import 'estilo.dart' as estilo;
import 'proyecto.dart' as proyecto;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum Filtro { primero, grafico, industrial, sistemaModa, integradoVertical }

var mapeo = {
  'primero': 'primer año',
  'grafico': 'gráfico',
  'industrial': 'industrial',
  'sistemaModa': 'sistema moda',
  'integradoVertical': 'integrado vertical',
};

class _FilterChipExampleState extends State<FilterChipExample> {
  Set<Filtro> filters = <Filtro>{};

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
          // const SizedBox(height: 5.0),
          Wrap(
            spacing: 5.0,
            children: Filtro.values.map((Filtro exercise) {
              return FilterChip(
                label: Text(mapeo[exercise.name.toString()]!),
                selected: filters.contains(exercise),
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      filters.add(exercise);
                    } else {
                      filters.remove(exercise);
                    }
                  });
                },
              );
            }).toList(),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class FilterChipExample extends StatefulWidget {
  const FilterChipExample({super.key});

  @override
  State<FilterChipExample> createState() => _FilterChipExampleState();
}

final listaProyectos = FutureBuilder<List<proyecto.Proyecto>>(
  future: proyecto.fetchProyectos(http.Client()),
  builder: (context, snapshot) {
    if (snapshot.hasError) {
      return const Center(
        child: Text(
          'cargando info...!',
          style: estilo.estiloTextoCargando,
        ),
      );
    } else if (snapshot.hasData) {
      return proyecto.ProyectosList(proyectos: snapshot.data!);
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  },
);
