import 'package:equatable/equatable.dart';

import 'garage_info.dart';

class Parking extends Equatable {
  const Parking(this.countAvailable, this.garages);

  final int countAvailable;
  final List<GarageInfo> garages;

  @override
  List<Object?> get props => <Object?>[countAvailable, garages];
}
