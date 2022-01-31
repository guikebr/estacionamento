import '../../domain/entities/car_info.dart';
import '../../domain/entities/garage.dart';
import '../../domain/entities/garage_info.dart';

class GarageModel extends Garage implements GarageInfo {
  const GarageModel({
    required int id,
    CarInfo? car,
    DateTime? entrance,
    DateTime? exit,
    double? total,
  }) : super(id: id, car: car, entrance: entrance, exit: exit, total: total);
}
