import 'package:equatable/equatable.dart';

import 'car_info.dart';

class Garage extends Equatable {
  const Garage({
    required this.id,
    this.total,
    this.car,
    this.entrance,
    this.exit,
  });

  final int id;
  final double? total;
  final CarInfo? car;
  final DateTime? entrance;
  final DateTime? exit;

  @override
  List<Object?> get props => <Object?>[id, total, entrance, exit, car];
}
