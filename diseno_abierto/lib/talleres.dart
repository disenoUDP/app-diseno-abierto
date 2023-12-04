import 'estilo.dart' as estilo;
import 'taller.dart' as taller;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final listaTalleres = FutureBuilder<List<taller.Taller>>(
  future: taller.fetchTalleres(http.Client()),
  builder: (context, snapshot) {
    if (snapshot.hasError) {
      return const Center(
        child: Text(
          'cargando info...!',
          style: estilo.estiloTextoCargando,
        ),
      );
    } else if (snapshot.hasData) {
      return taller.TalleresList(talleres: snapshot.data!);
      // return Column(
      //   children: <Widget>[
      //     const Spacer(),
      //     taller.TalleresList(talleres: snapshot.data!),
      //     const Spacer(),
      //   ],
      // );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  },
);
