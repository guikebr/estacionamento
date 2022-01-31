import '../../domain/entities/garage_info.dart';
import '../../domain/entities/parking.dart';
import '../../domain/entities/parking_info.dart';

class ParkingModel extends Parking implements ParkingInfo {
  const ParkingModel(int countAvailable, List<GarageInfo> garages)
      : super(countAvailable, garages);
}
