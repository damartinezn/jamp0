class Estudiante{
  int id;
  String nombre;
  String apellido;
  String correo;
  String celular;
  String fecha;

  Estudiante(this.id, this.nombre, this.apellido, this.correo, this.celular, this.fecha);

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      'id'         :id,
      'nombre'     :nombre,
      'apellido'   :apellido,
      'correo'     :correo,
      'celular'    :celular,
      'fecha'      :fecha
    };
    return map;
  }

  Estudiante.fromMap(Map<String, dynamic> map){
    id       = map['id'];
    nombre   = map['nombre'];
    apellido = map['apellido'];
    correo   = map['correo'];
    celular  = map['celular']; 
    fecha    = map['fecha']; 
  }

}