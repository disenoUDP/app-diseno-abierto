import 'estilo.dart' as estilo;
import 'proyecto.dart' as proyecto;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum ExerciseFilter {
  primero,
  grafico,
  industrial,
  sistemaModa,
  integradoVertical
}

var myMap = {
  'primero': 'primer año',
  'grafico': 'gráfico',
  'industrial': 'industrial',
  'sistemaModa': 'sistema moda',
  'integradoVertical': 'integrado vertical',
};

class _FilterChipExampleState extends State<FilterChipExample> {
  Set<ExerciseFilter> filters = <ExerciseFilter>{};

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 5.0),
          Wrap(
            spacing: 5.0,
            children: ExerciseFilter.values.map((ExerciseFilter exercise) {
              return FilterChip(
                // label: Text(exercise.name),
                label: Text(myMap[exercise.name.toString()]!),
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
