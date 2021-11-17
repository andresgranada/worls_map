class Map2 {
  int ID;
  String URL_Imagen;
  String Titulo;
  String Empresa;
  String Tipo;
  String Zona_Geografica;
  String Escala;
  int Disponible;

  Map2({
    this.ID,
    this.URL_Imagen,
    this.Titulo,
    this.Empresa,
    this.Tipo,
    this.Zona_Geografica,
    this.Escala,
    this.Disponible,
  });

  factory Map2.fromJson(Map<String, dynamic> json) {
    return Map2(
      ID: json['ID'],
      URL_Imagen: json['URL_Imagen'],
      Titulo: json['Titulo'],
      Empresa: json['Empresa'],
      Tipo: json['Tipo'],
      Zona_Geografica: json['Zona_Geografica'],
      Escala: json['Escala'],
      Disponible: json['Disponible'],
    );
  }
}