import 'package:equatable/equatable.dart';

import 'enviado.dart';

class MSent extends Equatable {
	final List<Enviado>? enviados;

	const MSent({this.enviados});

	factory MSent.fromJson(Map<String, dynamic> json) => MSent(
				enviados: (json['enviados'] as List<dynamic>?)
						?.map((e) => Enviado.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'enviados': enviados?.map((e) => e.toJson()).toList(),
			};

		MSent copyWith({
		List<Enviado>? enviados,
	}) {
		return MSent(
			enviados: enviados ?? this.enviados,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [enviados];
}
