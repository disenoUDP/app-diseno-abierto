import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'archivos.dart' as archivos;

enum Llave { planta1, planta2, planta3 }

class MenuRadio extends StatefulWidget {
  const MenuRadio({super.key});

  @override
  State<MenuRadio> createState() => _EstadoMenuRadio();
}

class _EstadoMenuRadio extends State<MenuRadio> {
  Llave? _character = Llave.planta1;

  var pathMapa = archivos.imagenPlanta1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('primera planta'),
          leading: Radio<Llave>(
            value: Llave.planta1,
            groupValue: _character,
            onChanged: (Llave? value) {
              setState(() {
                _character = value;
                if (_character == Llave.planta1) {
                  pathMapa = archivos.imagenPlanta1;
                }
              });
            },
          ),
        ),
        ListTile(
          title: const Text('segunda planta'),
          leading: Radio<Llave>(
            value: Llave.planta2,
            groupValue: _character,
            onChanged: (Llave? value) {
              setState(() {
                _character = value;
                if (_character == Llave.planta2) {
                  pathMapa = archivos.imagenPlanta2;
                }
              });
            },
          ),
        ),
        ListTile(
          title: const Text('tercera planta'),
          leading: Radio<Llave>(
            value: Llave.planta3,
            groupValue: _character,
            onChanged: (Llave? value) {
              setState(() {
                _character = value;
                if (_character == Llave.planta3) {
                  pathMapa = archivos.imagenPlanta3;
                }
              });
            },
          ),
        ),
        Center(
          child: InteractiveViewer(
            boundaryMargin: const EdgeInsets.all(20.0),
            minScale: 0.1,
            maxScale: 5.0,
            child: FadeInImage.memoryNetwork(
                fit: BoxFit.contain,
                placeholder: kTransparentImage,
                width: 400,
                height: 400,
                image: pathMapa),
          ),
        ),
        //     return Center(
//       child: InteractiveViewer(
//         boundaryMargin: const EdgeInsets.all(20.0),
//         minScale: 0.1,
//         maxScale: 1.6,
//         child: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: <Color>[Colors.orange, Colors.red],
//               stops: <double>[0.0, 1.0],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

        // FadeInImage.memoryNetwork(
        //     fit: BoxFit.contain,
        //     placeholder: kTransparentImage,
        //     width: 400,
        //     height: 400,
        //     image: pathMapa),
      ],
    );
  }
}

const selectorMapas = Column(
  children: [
    Spacer(),
    MenuRadio(),
    Spacer(),
  ],
);
