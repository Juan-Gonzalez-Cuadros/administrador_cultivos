import 'package:equatable/equatable.dart';

import 'detalles.dart';

class Messages extends Equatable {
  final List<Detalles>? detalles;

  const Messages({this.detalles});

  factory Messages.fromJson(Map<String, dynamic> json) => Messages(
        detalles: (json['detalles'] as List<dynamic>?)
            ?.map((e) => Detalles.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'detalles': detalles?.map((e) => e.toJson()).toList(),
      };

  Messages copyWith({
    List<Detalles>? detalles,
  }) {
    return Messages(
      detalles: detalles ?? this.detalles,
    );
  }

  /*@override
	bool get stringify => true;*/

  @override
  List<Object?> get props => [detalles];
}
