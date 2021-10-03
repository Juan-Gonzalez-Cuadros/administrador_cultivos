import 'package:equatable/equatable.dart';

class Recibido extends Equatable {
  final int? id;
  final String? email;
  final String? asunto;
  final String? contenido;

  const Recibido({this.id, this.email, this.asunto, this.contenido});

  factory Recibido.fromJson(Map<String, dynamic> json) => Recibido(
        id: json['id'] as int?,
        email: json['email'] as String?,
        asunto: json['asunto'] as String?,
        contenido: json['contenido'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'asunto': asunto,
        'contenido': contenido,
      };

  Recibido copyWith({
    int? id,
    String? email,
    String? asunto,
    String? contenido,
  }) {
    return Recibido(
      id: id ?? this.id,
      email: email ?? this.email,
      asunto: asunto ?? this.asunto,
      contenido: contenido ?? this.contenido,
    );
  }

  /*@override
	bool get stringify => true;*/

  @override
  List<Object?> get props => [id, email, asunto, contenido];
}
