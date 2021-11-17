class MapReserved {
  String Clave_Usuario;
  String URL_Imagen;
  String Titulo;
  int ID_Mapa;
  String Fecha_Prestamo;
  String Fecha_Devolucion;
  String Estatus;

  MapReserved({
    this.Clave_Usuario,
    this.URL_Imagen,
    this.Titulo,
    this.ID_Mapa,
    this.Fecha_Prestamo,
    this.Fecha_Devolucion,
    this.Estatus,
  });

  factory MapReserved.fromJson(Map<String, dynamic> json) {
    return MapReserved(
      Clave_Usuario: json['Clave_Usuario'],
      URL_Imagen: json['URL_Imagen'],
      Titulo: json['Titulo'],
      ID_Mapa: json['ID_Mapa'],
      Fecha_Prestamo: json['Fecha_Prestamo'],
      Fecha_Devolucion: json['Fecha_Devolucion'],
      Estatus: json['Estatus'],
    );
  }
}