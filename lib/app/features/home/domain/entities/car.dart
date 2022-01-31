import 'package:equatable/equatable.dart';

class Car extends Equatable {
  const Car({
    required this.id,
    required this.plate,
    required this.name,
    required this.contact,
  });

  final int id;
  final String plate;
  final String name;
  final String contact;

  @override
  List<Object?> get props => <Object?>[id, plate, name, contact];
}
