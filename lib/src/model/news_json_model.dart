class Noticia {
  String anulado;
  String banner;
  List<Comentario> comentario;
  String contenido;
  String fechaPublicacion;
  int id;
  int idPerfil;
  String multimedia;
  Perfil perfil;
  String resumen;
  String titulo;
  int valoracion;

  Noticia(
      {this.anulado,
      this.banner,
      this.comentario,
      this.contenido,
      this.fechaPublicacion,
      this.id,
      this.idPerfil,
      this.multimedia,
      this.perfil,
      this.resumen,
      this.titulo,
      this.valoracion});

  Noticia.fromJson(Map<String, dynamic> json) {
    anulado = json['Anulado'];
    banner = json['Banner'];
    if (json['Comentario'] != null) {
      comentario = new List<Comentario>();
      json['Comentario'].forEach((v) {
        comentario.add(new Comentario.fromJson(v));
      });
    }
    contenido = json['Contenido'];
    fechaPublicacion = json['FechaPublicacion'];
    id = json['Id'];
    idPerfil = json['IdPerfil'];
    multimedia = json['Multimedia'];
    perfil =
        json['Perfil'] != null ? new Perfil.fromJson(json['Perfil']) : null;
    resumen = json['Resumen'];
    titulo = json['Titulo'];
    valoracion = json['Valoracion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Anulado'] = this.anulado;
    data['Banner'] = this.banner;
    if (this.comentario != null) {
      data['Comentario'] = this.comentario.map((v) => v.toJson()).toList();
    }
    data['Contenido'] = this.contenido;
    data['FechaPublicacion'] = this.fechaPublicacion;
    data['Id'] = this.id;
    data['IdPerfil'] = this.idPerfil;
    data['Multimedia'] = this.multimedia;
    if (this.perfil != null) {
      data['Perfil'] = this.perfil.toJson();
    }
    data['Resumen'] = this.resumen;
    data['Titulo'] = this.titulo;
    data['Valoracion'] = this.valoracion;
    return data;
  }
}

class Comentario {
  String anulado;
  String comentario;
  String fechaPublicacion;
  int id;
  int idPerfil;
  Perfil perfil;

  Comentario(
      {this.anulado,
      this.comentario,
      this.fechaPublicacion,
      this.id,
      this.idPerfil,
      this.perfil});

  Comentario.fromJson(Map<String, dynamic> json) {
    anulado = json['Anulado'];
    comentario = json['Comentario'];
    fechaPublicacion = json['FechaPublicacion'];
    id = json['Id'];
    idPerfil = json['IdPerfil'];
    perfil =
        json['Perfil'] != null ? new Perfil.fromJson(json['Perfil']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Anulado'] = this.anulado;
    data['Comentario'] = this.comentario;
    data['FechaPublicacion'] = this.fechaPublicacion;
    data['Id'] = this.id;
    data['IdPerfil'] = this.idPerfil;
    if (this.perfil != null) {
      data['Perfil'] = this.perfil.toJson();
    }
    return data;
  }
}

class Perfil {
  String apellido;
  String celular;
  String direccion;
  String documento;
  String email;
  String foto;
  int id;
  String nombre;
  String sexo;
  String tipoDocumento;

  Perfil(
      {this.apellido,
      this.celular,
      this.direccion,
      this.documento,
      this.email,
      this.foto,
      this.id,
      this.nombre,
      this.sexo,
      this.tipoDocumento});

  Perfil.fromJson(Map<String, dynamic> json) {
    apellido = json['Apellido'];
    celular = json['Celular'];
    direccion = json['Direccion'];
    documento = json['Documento'];
    email = json['Email'];
    foto = json['Foto'];
    id = json['Id'];
    nombre = json['Nombre'];
    sexo = json['Sexo'];
    tipoDocumento = json['TipoDocumento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Apellido'] = this.apellido;
    data['Celular'] = this.celular;
    data['Direccion'] = this.direccion;
    data['Documento'] = this.documento;
    data['Email'] = this.email;
    data['Foto'] = this.foto;
    data['Id'] = this.id;
    data['Nombre'] = this.nombre;
    data['Sexo'] = this.sexo;
    data['TipoDocumento'] = this.tipoDocumento;
    return data;
  }
}
