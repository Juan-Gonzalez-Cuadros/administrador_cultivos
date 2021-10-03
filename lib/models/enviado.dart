import 'package:equatable/equatable.dart';

class Enviado extends Equatable {
	final int? id;
	final String? email;
	final String? asunto;
	final String? contenido;

	const Enviado({this.id, this.email, this.asunto, this.contenido});

	factory Enviado.fromJson(Map<String, dynamic> json) => Enviado(
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

		Enviado copyWith({
		int? id,
		String? email,
		String? asunto,
		String? contenido,
	}) {
		return Enviado(
			id: id ?? this.id,
			email: email ?? this.email,
			asunto: asunto ?? this.asunto,
			contenido: contenido ?? this.contenido,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [id, email, asunto, contenido];
}
