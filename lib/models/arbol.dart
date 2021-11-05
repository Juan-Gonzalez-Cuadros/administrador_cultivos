import 'package:equatable/equatable.dart';

import 'detalles.dart';

class Arbol extends Equatable {
  final List<Detalles>? detalles;

  const Arbol({this.detalles});

  factory Arbol.fromJson(Map<String, dynamic> json) => Arbol(
        detalles: (json['detalles'] as List<dynamic>?)
            ?.map((e) => Detalles.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'detalles': detalles?.map((e) => e.toJson()).toList(),
      };

  Arbol copyWith({
    List<Detalles>? detalles,
  }) {
    return Arbol(
      detalles: detalles ?? this.detalles,
    );
  }

  /*@override
	bool get stringify => true;*/

  @override
  List<Object?> get props => [detalles];
}
