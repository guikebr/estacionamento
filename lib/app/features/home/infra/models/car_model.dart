import '../../domain/entities/car.dart';
import '../../domain/entities/car_info.dart';

class CarModel extends Car implements CarInfo {
  const CarModel({
    required int id,
    required String plate,
    required String name,
    required String contact,
  }) : super(id: id, plate: plate, name: name, contact: contact);
}
