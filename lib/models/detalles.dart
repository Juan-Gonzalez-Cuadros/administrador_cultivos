import 'package:equatable/equatable.dart';

class Detalles extends Equatable {
  final String? tipo;
  final String? imgUrl;
  final int? id;
  final String? name;
  final String? estado;
  final String? abono;
  final String? descripcion;

  const Detalles(
      {this.tipo,
      this.imgUrl,
      this.id,
      this.name,
      this.estado,
      this.abono,
      this.descripcion});

  factory Detalles.fromJson(Map<String, dynamic> json) => Detalles(
        tipo: json['tipo'] as String?,
        imgUrl: json['imgUrl'] as String?,
        id: json['id'] as int?,
        name: json['name'] as String?,
        estado: json['estado'] as String?,
        abono: json['abono'] as String?,
        descripcion: json['descripcion'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'tipo': tipo,
        'imgUrl': imgUrl,
        'id': id,
        'name': name,
        'estado': estado,
        'abono': abono,
        'descripcion': descripcion,
      };

  Detalles copyWith({
    String? tipo,
    String? imgUrl,
    int? id,
    String? name,
    String? estado,
    String? abono,
    String? descripcion,
  }) {
    return Detalles(
      tipo: tipo ?? this.tipo,
      imgUrl: imgUrl ?? this.imgUrl,
      id: id ?? this.id,
      name: name ?? this.name,
      estado: estado ?? this.estado,
      abono: abono ?? this.abono,
      descripcion: descripcion ?? this.descripcion,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props =>
      [tipo, imgUrl, id, name, estado, abono, descripcion];
}
