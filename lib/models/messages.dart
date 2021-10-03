import 'package:equatable/equatable.dart';

import 'recibido.dart';

class Messages extends Equatable {
  final List<Recibido>? recibidos;

  const Messages({this.recibidos});

  factory Messages.fromJson(Map<String, dynamic> json) => Messages(
        recibidos: (json['recibidos'] as List<dynamic>?)
            ?.map((e) => Recibido.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'recibidos': recibidos?.map((e) => e.toJson()).toList(),
      };

  Messages copyWith({
    List<Recibido>? recibidos,
  }) {
    return Messages(
      recibidos: recibidos ?? this.recibidos,
    );
  }

  /*@override
	bool get stringify => true;*/

  @override
  List<Object?> get props => [recibidos];
}
