class Taller {
  final String sigla;
  final String nombre;
  final String docentePrincipal;
  final String docenteAuxiliar;
  final String ayudante;
  final String nivel;
  final String url;
  final String thumbnailUrl;

  const Taller(
      {required this.sigla,
      required this.nombre,
      required this.docentePrincipal,
      required this.docenteAuxiliar,
      required this.ayudante,
      required this.nivel,
      required this.url,
      required this.thumbnailUrl});

  factory Taller.fromJson(Map<String, dynamic> json) {
    return Taller(
      sigla: json['sigla'] as String,
      nombre: json['nombre'] as String,
      docentePrincipal: json['docentePrincipal'] as String,
      docenteAuxiliar: json['docenteAuxiliar'] as String,
      ayudante: json['ayudante'] as String,
      nivel: json['nivel'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}
